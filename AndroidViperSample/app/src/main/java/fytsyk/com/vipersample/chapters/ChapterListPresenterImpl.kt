package fytsyk.com.vipersample.chapters

import fytsyk.com.vipersample.chapters.viper.*

class ChapterListPresenterImpl(private val chapterListInteractor: GetChaptersInteractor,
                               private val view: ChapterListView,
                               private val router: ChapterListRouter) : ChapterListPresenter {


    override fun start() {
        view.showProgress(true)
        chapterListInteractor.execute(null, {
            view.showChapters(it)
        }) {
            view.showErrorMessage(it.message)
        }
    }

    override fun stop() {
        chapterListInteractor.cancel()
    }

    override fun userItemClicked(chapter: Chapter) {
        router.openChapterDetails(chapter)
    }
}