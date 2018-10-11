package fytsyk.com.vipersample.chapterDetails

import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsInteractor
import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsPresenter
import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsRouter
import fytsyk.com.vipersample.chapterDetails.viper.ChapterDetailsView
import fytsyk.com.vipersample.chapters.viper.ChapterViewModel
import fytsyk.com.vipersample.chapters.viper.getIconForChapterType

class ChapterDetailsPresenterImpl(private val chapterId: String,
                                  private val chapterDetailsInteractor: ChapterDetailsInteractor,
                                  private val view: ChapterDetailsView,
                                  private val router: ChapterDetailsRouter) : ChapterDetailsPresenter {
    override fun start() {
        chapterDetailsInteractor.execute(chapterId, {
            val viewModel = ChapterViewModel(it?.title!!, it.description, getIconForChapterType(it.type))
            view.showChapterDetails(viewModel)
        }, {
            view.showErrorMessage(it.localizedMessage)
        })
    }

    override fun stop() {
        chapterDetailsInteractor.cancel()
    }
}