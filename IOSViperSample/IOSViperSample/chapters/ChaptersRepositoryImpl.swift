//
// Created by Ivan Phytsyk on 9/29/18.
// Copyright (c) 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class ChaptersRepositoryImpl: ChapterRepository {
    
    let chapters: [Chapter] = [Chapter(title: "About Book", description: "Short description about author and this book content", type: ChapterType.about_book)
        , Chapter(title: "Classes", description: "Explains about classes, there differences in both languages and unique features", type: ChapterType.classes_interfaces)
        , Chapter(title: "Layouts", description: "ConstraintLayout and AutoLayout as an approach of interface building", type: ChapterType.layouts)
        , Chapter(title: "Functions", description: "Functions syntax, usage. Lambdas and high-level functions.", type: ChapterType.functions)
        , Chapter(title: "Collections", description: "Short brief about collections types and their usage", type: ChapterType.collections)
        , Chapter(title: "Data types", description: "Basic data types, optionals and nullables", type: ChapterType.data_types)
        , Chapter(title: "Asynchronous execution", description: "Starting tasks in background and sending result back to UI thread", type: ChapterType.asynchronous)
        , Chapter(title: "Project structure", description: "Files and folders projects consist of", type: ChapterType.project_structure)
        , Chapter(title: "View Controllers", description: "Activity and UIViewController purpose, layout and lifecycles", type: ChapterType.viewcontroller)
        , Chapter(title: "Dimensions", description: "Widgets sizes units: point and dp", type: ChapterType.dimensions)
        , Chapter(title: "Layout", description: "ConstraintLayout and AutoLayout. Creating layout with constraints to support various screen sizes", type: ChapterType.layouts)
        , Chapter(title: "Lists", description: "Recycled widget list. Delegators and Adapters.", type: ChapterType.lists)
        , Chapter(title: "Do we need the same architecture", description: "My opinion about mobile architecture", type: ChapterType.why)
        , Chapter(title: "V.I.P.E.R", description: "My architecture approach describing", type: ChapterType.viper)
        , Chapter(title: "Testing", description: "Unit tests for business logic.", type: ChapterType.testing)
        
    ]
    
    func getChapter(_ title: String) -> Chapter {
        return chapters.first(where: {
            $0.title == title
        })!
    }
    
    func getChapters() -> Array<Chapter> {
        return chapters
    }
    
    
}
