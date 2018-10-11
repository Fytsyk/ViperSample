package fytsyk.com.vipersample.base

import kotlinx.coroutines.experimental.GlobalScope
import kotlinx.coroutines.experimental.Job
import kotlinx.coroutines.experimental.launch
import kotlin.coroutines.experimental.CoroutineContext

abstract class BaseInteractor<INPUT, OUTPUT>( private val executionContext: CoroutineContext,
                                             private val resultContext: CoroutineContext) {


    protected abstract suspend fun execute(input: INPUT?): OUTPUT

    private var onResult: ((OUTPUT) -> Unit)? = null
    private var onError: ((Throwable) -> Unit)? = null

    private var job: Job? = null

    private var input: INPUT? = null

    fun execute(input: INPUT? = null, onResult: ((OUTPUT?) -> Unit)?, onError: ((Throwable) -> Unit)?) {
        this.input = input
        this.onResult = onResult
        this.onError = onError
        job = GlobalScope.launch(executionContext) {
            executeSafe()
        }
    }

    fun cancel() {
        job?.cancel()
        onResult = null
        onError = null
    }

    private suspend fun executeSafe() {
        try {
            val result = execute(input)
            runInResultContext { onResult?.invoke(result) }
        } catch (throwable: Throwable) {
            runInResultContext { onError?.invoke(throwable) }
        }
    }

    private fun runInResultContext(block: () -> Unit) {
        GlobalScope.launch(resultContext) {
            block()
        }
    }
}