package fytsyk.com.vipersample.chapters.ui

import android.content.Intent
import android.os.Bundle

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ProgressBar
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import fytsyk.com.vipersample.R
import fytsyk.com.vipersample.chapterDetails.ChapterDetailsActivity
import fytsyk.com.vipersample.chapterDetails.EXTRA_CHAPTER_TITLE
import fytsyk.com.vipersample.chapters.ChapterListPresenterImpl
import fytsyk.com.vipersample.chapters.ChaptersRepositoryImpl
import fytsyk.com.vipersample.chapters.viper.*
import kotlinx.coroutines.experimental.Dispatchers
import kotlinx.coroutines.experimental.IO
import kotlinx.coroutines.experimental.android.Main

class ChapterListActivity : AppCompatActivity(), ChapterListView, ChapterListRouter {

    private val adapter = ChaptersAdapter()
    private var items: List<ChapterViewModel>? = ArrayList<ChapterViewModel>()

    private val listView by lazy {
        findViewById<RecyclerView>(R.id.list)
    }

    private val progressBar by lazy {
        findViewById<ProgressBar>(R.id.progressBar)
    }

    private lateinit var presenter: ChapterListPresenter

    override fun showChapters(chapters: List<ChapterViewModel>?) {
        showProgress(false)
        items = chapters
        adapter.notifyDataSetChanged()
    }

    override fun showProgress(show: Boolean) {
        progressBar.visibility = if (show) View.VISIBLE else View.GONE
        listView.visibility = if (show) View.GONE else View.VISIBLE
    }

    override fun showErrorMessage(message: String?) {
        showProgress(false)
        AlertDialog.Builder(this)
                .setTitle("Error")
                .setMessage(message)
                .show()
    }

    override fun openChapterDetails(chapter: ChapterViewModel) {
        val intent = Intent(this, ChapterDetailsActivity::class.java)
                .putExtra(EXTRA_CHAPTER_TITLE, chapter.title)
        startActivity(intent)
    }

    override fun exit() {
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_chapter_list)

        initPresenter()

        listView.layoutManager = LinearLayoutManager(this, RecyclerView.VERTICAL, false)
        listView.adapter = adapter
    }

    private fun initPresenter() {
        val interactor = GetChaptersInteractor(executionContext = Dispatchers.IO,
                resultContext = Dispatchers.Main, chapterRepository = ChaptersRepositoryImpl())
        presenter = ChapterListPresenterImpl(interactor, this, this)
    }

    override fun onStart() {
        super.onStart()
        presenter.start()
    }

    override fun onStop() {
        super.onStop()
        presenter.stop()
    }

    inner class ChaptersAdapter : RecyclerView.Adapter<ChapterViewHolder>() {
        override fun onCreateViewHolder(viewGroup: ViewGroup, position: Int): ChapterViewHolder {
            val view = LayoutInflater.from(this@ChapterListActivity).inflate(R.layout.list_item, viewGroup, false)
            return ChapterViewHolder(view)
        }

        override fun getItemCount() = items?.size ?: 0

        override fun onBindViewHolder(viewHolder: ChapterViewHolder, position: Int) {
            val chapter = items!![position]
            viewHolder.titleView.text = chapter.title
            viewHolder.descriptionView.text = chapter.description
            viewHolder.imageView.setImageResource(chapter.iconRes)

            viewHolder.itemView.setOnClickListener { presenter.chapterItemClicked(chapter) }
        }
    }
}
