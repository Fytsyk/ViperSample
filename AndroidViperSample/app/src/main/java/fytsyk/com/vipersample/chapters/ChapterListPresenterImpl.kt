package fytsyk.com.vipersample.chapters

import fytsyk.com.vipersample.chapters.viper.*

class ChapterListPresenterImpl(private val chapterListInteractor: GetChaptersInteractor,
                               private val view: ChapterListView,
                               private val router: ChapterListRouter) : ChapterListPresenter {


    override fun start() {
        view.showProgress(true)
        chapterListInteractor.execute(null, { chapter ->
            val viewModels = chapter?.map {
                ChapterViewModel(it.title,
                        it.description, getIconForChapterType(it.type))
            }
            view.showChapters(viewModels)
        }) {
            view.showErrorMessage(it.message)
        }
    }

    override fun stop() {
        chapterListInteractor.cancel()
    }

    override fun chapterItemClicked(chapter: ChapterViewModel) {
        router.openChapterDetails(chapter)
    }
}