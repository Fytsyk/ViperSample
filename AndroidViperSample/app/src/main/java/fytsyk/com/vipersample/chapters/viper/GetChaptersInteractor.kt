package fytsyk.com.vipersample.chapters.viper

import base.BaseInteractor
import fytsyk.com.vipersample.chapters.viper.Chapter
import fytsyk.com.vipersample.chapters.viper.ChapterRepository
import kotlinx.coroutines.experimental.delay
import kotlin.coroutines.experimental.CoroutineContext


class GetChaptersInteractor(executionContext: CoroutineContext,
                            resultContext: CoroutineContext,
                            val chapterRepository: ChapterRepository)
    : BaseInteractor<Any, List<Chapter>>(executionContext, resultContext) {

    override suspend fun execute(input: Any?): List<Chapter> {
        delay(2000) //emulates long execution
        return chapterRepository.getChapters()
    }
}