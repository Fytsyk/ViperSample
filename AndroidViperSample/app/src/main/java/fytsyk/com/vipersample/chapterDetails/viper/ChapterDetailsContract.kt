package fytsyk.com.vipersample.chapterDetails.viper

import fytsyk.com.vipersample.chapters.viper.ChapterViewModel

interface ChapterDetailsView {
    fun showChapterDetails(chapter: ChapterViewModel?)
    fun showProgress(show: Boolean)
    fun showErrorMessage(message: String?)
}

interface ChapterDetailsPresenter {
    fun start()
    fun stop()
}

interface ChapterDetailsRouter {
    fun exit()
}
