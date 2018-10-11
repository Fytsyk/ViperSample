package fytsyk.com.vipersample.chapterDetails.viper

import fytsyk.com.vipersample.base.BaseInteractor
import fytsyk.com.vipersample.chapters.viper.Chapter
import fytsyk.com.vipersample.chapters.viper.ChapterRepository
import kotlin.coroutines.experimental.CoroutineContext

class ChapterDetailsInteractor(executionContext: CoroutineContext,
                               resultContext: CoroutineContext,
                               private val chapterRepository: ChapterRepository) :
        BaseInteractor<String, Chapter>(executionContext, resultContext) {

    override suspend fun execute(input: String?): Chapter {
        return chapterRepository.getChapter(input!!)
    }

}
