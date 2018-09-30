package fytsyk.com.vipersample.chapters

import fytsyk.com.vipersample.chapters.viper.Chapter
import fytsyk.com.vipersample.chapters.viper.ChapterRepository

/**
 * Just hardcoded list of business objects. Usually it uses network/db for data fetching or saving
 */
class ChaptersRepositoryImpl : ChapterRepository {
    override fun getChapters(): List<Chapter> {
        return listOf(Chapter("About Book", "Short description about author and this book content")
                , Chapter("Classes", "Explains about classes, there differences in both languages and unique features")
                , Chapter("Layouts", "ConstraintLayout and AutoLayout as an approach of interface building")
                , Chapter("Functions", "Functions syntax, usage. Lambdas and high-level functions.")
                , Chapter("Collections", "Short brief about collections types and their usage"))
    }
}