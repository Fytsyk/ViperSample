package fytsyk.com.vipersample.chapters

import fytsyk.com.vipersample.chapters.viper.Chapter
import fytsyk.com.vipersample.chapters.viper.ChapterRepository
import fytsyk.com.vipersample.chapters.viper.ChapterType

/**
 * Just hardcoded list of business objects. Usually it uses network/db for data fetching or saving
 */
class ChaptersRepositoryImpl : ChapterRepository {

    val chapterList = listOf(Chapter("About Book", "Short    about author and this book content", ChapterType.about_book)
            , Chapter("Classes", "Explains about classes, there differences in both languages and unique features", ChapterType.classes_interfaces)
            , Chapter("Layouts", "ConstraintLayout and AutoLayout as an approach of interface building", ChapterType.layouts)
            , Chapter("Functions", "Functions syntax, usage. Lambdas and high-level functions.", ChapterType.functions)
            , Chapter("Collections", "Short brief about collections types and their usage", ChapterType.collections)
            , Chapter("Data types", "Basic data types, optionals and nullables", ChapterType.data_types)
            , Chapter("Asynchronous execution", "Starting tasks in background and sending result back to UI thread", ChapterType.asynchronous)
            , Chapter("Project structure", "Files and folders projects consist of", ChapterType.project_structure)
            , Chapter("View Controllers", "Activity and UIViewController purpose, layout and lifecycles", ChapterType.viewcontroller)
            , Chapter("Dimensions", "Widgets sizes units  point and dp", ChapterType.dimensions)
            , Chapter("Layout", "ConstraintLayout and AutoLayout. Creating layout with constraints to support various screen sizes", ChapterType.layouts)
            , Chapter("Lists", "Recycled widget list. Delegators and Adapters.", ChapterType.lists)
            , Chapter("Do we need the same architecture", "My opinion about mobile architecture", ChapterType.why)
            , Chapter("V.I.P.E.R", "My architecture approach describing", ChapterType.viper)
            , Chapter("Testing", "Unit tests for business logic.", ChapterType.testing))

    override fun getChapters(): List<Chapter> {
        return chapterList
    }

    override fun getChapter(title: String): Chapter {
        return chapterList.find { it.title == title }!!
    }
}