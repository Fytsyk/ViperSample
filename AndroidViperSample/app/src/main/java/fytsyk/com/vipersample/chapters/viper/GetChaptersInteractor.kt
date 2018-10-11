package fytsyk.com.vipersample.chapters.viper

import fytsyk.com.vipersample.base.BaseInteractor
import kotlinx.coroutines.experimental.delay
import kotlin.coroutines.experimental.CoroutineContext


class GetChaptersInteractor(executionContext: CoroutineContext,
                            resultContext: CoroutineContext,
                            val chapterRepository: ChapterRepository)
    : BaseInteractor<Any, List<Chapter>>(executionContext, resultContext) {

    override suspend fun execute(input: Any?): List<Chapter> {
        return chapterRepository.getChapters()
    }
}