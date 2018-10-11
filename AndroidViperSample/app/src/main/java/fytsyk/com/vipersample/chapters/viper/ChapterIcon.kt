package fytsyk.com.vipersample.chapters.viper

import androidx.annotation.DrawableRes
import fytsyk.com.vipersample.R
import fytsyk.com.vipersample.chapters.viper.ChapterType.*

enum class ChapterType {
    testing,
    viper,
    why,
    cross_platforms_architecturing,
    lists,
    layouts,
    dimensions,
    viewcontroller,
    project_structure,
    android_ios,
    asynchronous,
    collections,
    data_types,
    classes_interfaces,
    functions,
    variables,
    kotlin_vs_swift,
    about_book
}

@DrawableRes
fun getIconForChapterType(type: ChapterType): Int {
    return when (type) {
        about_book ->
            R.drawable.chapter_icon_about_book
        kotlin_vs_swift ->
            R.drawable.chapter_icon_kotlin_vs_swift
        variables ->
            R.drawable.chapter_icon_variables
        functions ->
            R.drawable.chapter_icon_functions
        classes_interfaces ->
            R.drawable.chapter_icon_classes_interfaces
        data_types ->
            R.drawable.chapter_icon_data_types
        collections ->
            R.drawable.chapter_icon_collections
        asynchronous ->
            R.drawable.chapter_icon_asynchronous
        android_ios ->
            R.drawable.chapter_icon_android_ios
        project_structure ->
            R.drawable.chapter_icon_project_structure
        viewcontroller ->
            R.drawable.chapter_icon_viewcontroller
        dimensions ->
            R.drawable.chapter_icon_dimensions
        layouts ->
            R.drawable.chapter_icon_layouts
        cross_platforms_architecturing ->
            R.drawable.chapter_icon_cross_platforms_architecturing
        why ->
            R.drawable.chapter_icon_why
        viper ->
            R.drawable.chapter_icon_viper
        testing ->
            R.drawable.chapter_icon_testing
        lists ->
            R.drawable.chapter_icon_lists
    }
}