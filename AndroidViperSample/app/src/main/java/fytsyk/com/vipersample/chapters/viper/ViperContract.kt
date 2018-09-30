package fytsyk.com.vipersample.chapters.viper


data class Chapter(val title: String, val description: String)

interface ChapterRepository {
    fun getChapters(): List<Chapter>
}

interface ChapterListView {
    fun showChapters(chapters: List<Chapter>?)
    fun showProgress(show: Boolean)
    fun showErrorMessage(message: String?)
}

interface ChapterListPresenter {
    fun start()
    fun stop()
    fun userItemClicked(chapter: Chapter)
}

interface ChapterListRouter {
    fun openChapterDetails(chapter: Chapter)
    fun exit()
}
