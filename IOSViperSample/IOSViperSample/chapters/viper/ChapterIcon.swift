//
//  ChapterIcon.swift
//  IOSViperSample
//
//  Created by Ivan Phytsyk on 10/9/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation
import UIKit

enum ChapterType {
    case testing
    case viper
    case why
    case cross_platforms_architecturing
    case lists
    case layouts
    case dimensions
    case viewcontroller
    case project_structure
    case android_ios
    case asynchronous
    case collections
    case data_types
    case classes_interfaces
    case functions
    case variables
    case kotlin_vs_swift
    case about_book
}

func getIconForChapterType(_ type : ChapterType)-> UIImage {
     switch(type) {
     case .about_book:
        return #imageLiteral(resourceName: "chapter_icon_about_book")
     case .kotlin_vs_swift:
        return #imageLiteral(resourceName: "chapter_icon_kotlin_vs_swift")
     case .variables:
        return #imageLiteral(resourceName: "chapter_icon_variables")
     case .functions:
        return #imageLiteral(resourceName: "chapter_icon_functions")
     case .classes_interfaces:
        return #imageLiteral(resourceName: "chapter_icon_classes_interfaces")
     case .data_types:
        return #imageLiteral(resourceName: "chapter_icon_data_types")
     case .collections:
        return #imageLiteral(resourceName: "chapter_icon_collections")
     case .asynchronous:
        return #imageLiteral(resourceName: "chapter_icon_asynchronous")
     case .android_ios:
        return #imageLiteral(resourceName: "chapter_icon_android_ios")
     case .project_structure:
        return #imageLiteral(resourceName: "chapter_icon_project_structure")
     case .viewcontroller:
        return #imageLiteral(resourceName: "chapter_icon_viewcontroller")
     case .dimensions:
        return #imageLiteral(resourceName: "chapter_icon_dimensions")
     case .layouts:
        return #imageLiteral(resourceName: "chapter_icon_layouts")
     case .cross_platforms_architecturing:
        return #imageLiteral(resourceName: "chapter_icon_cross_platforms_architecturing")
     case .why:
        return #imageLiteral(resourceName: "chapter_icon_why")
     case .viper:
        return #imageLiteral(resourceName: "chapter_icon_viper")
     case .testing:
        return #imageLiteral(resourceName: "chapter_icon_testing")
     case .lists:
        return #imageLiteral(resourceName: "chapter_icon_lists")
    }
}
