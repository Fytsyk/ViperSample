package fytsyk.com.vipersample.chapterDetails

import android.os.Bundle
import android.view.View
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import fytsyk.com.vipersample.R
import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsInteractor
import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsRouter
import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsView
import fytsyk.com.vipersample.chapters.ChaptersRepositoryImpl
import fytsyk.com.vipersample.chapters.viper.ChapterViewModel
import kotlinx.coroutines.experimental.Dispatchers
import kotlinx.coroutines.experimental.IO
import kotlinx.coroutines.experimental.android.Main

class ChapterDetailsActivity() : AppCompatActivity(), ChapterDetailsView, ChapterDetailsRouter {

    private var chapter: ChapterViewModel? = null
    private lateinit var presenter: ChapterDetailsPresenterImpl

    private val titleView: TextView by lazy {
        return@lazy this.findViewById<TextView>(R.id.chapterTitle)
    }

    private val descriptionView: TextView by lazy {
        return@lazy this.findViewById<TextView>(R.id.chapterDescription)
    }

    private val iconView: ImageView by lazy {
        return@lazy this.findViewById<ImageView>(R.id.chapterIcon)
    }
    private val progress: ProgressBar by lazy {
        return@lazy this.findViewById<ProgressBar>(R.id.chapterIcon)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_chapter_detail)

        val chapterId = intent.getStringExtra(EXTRA_CHAPTER_TITLE)

        val interactor = ChapterDetailsInteractor(executionContext = Dispatchers.IO,
                resultContext = Dispatchers.Main, chapterRepository = ChaptersRepositoryImpl())
        this.presenter = ChapterDetailsPresenterImpl(chapterId, interactor, this, this)
    }

    override fun onStart() {
        super.onStart()
        presenter.start()
    }

    override fun onStop() {
        super.onStop()
        presenter.stop()
    }

    override fun showChapterDetails(chapter: ChapterViewModel?) {
        this.chapter = chapter
        this.titleView.text = chapter?.title
        this.descriptionView.text = chapter?.description
        this.iconView.setImageResource(chapter?.iconRes ?: 0)
    }

    override fun showProgress(show: Boolean) {
        progress.visibility = if (show) View.VISIBLE else View.GONE
    }

    override fun showErrorMessage(message: String?) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
    }

    override fun exit() {

    }

}

val EXTRA_CHAPTER_TITLE = "extra_chapter_id"