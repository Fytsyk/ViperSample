package fytsyk.com.vipersample.chapters.viper

import androidx.annotation.DrawableRes


data class Chapter(val title: String, val description: String, val type: ChapterType)

data class ChapterViewModel(val title: String, val description: String, @DrawableRes val iconRes: Int)

interface ChapterRepository {
    fun getChapters(): List<Chapter>
    fun getChapter(title: String): Chapter
}

interface ChapterListView {
    fun showChapters(chapters: List<ChapterViewModel>?)
    fun showProgress(show: Boolean)
    fun showErrorMessage(message: String?)
}

interface ChapterListPresenter {
    fun start()
    fun stop()
    fun chapterItemClicked(chapter: ChapterViewModel)
}

interface ChapterListRouter {
    fun openChapterDetails(chapter: ChapterViewModel)
    fun exit()
}
