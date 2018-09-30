//
// Created by Ivan Phytsyk on 9/29/18.
// Copyright (c) 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class ChaptersRepositoryImpl: ChapterRepository {
    
    let chapters: [Chapter] = [Chapter(title: "About Book", description: "Short description about author and this book content")
        , Chapter(title: "Classes", description: "Explains about classes, there differences in both languages and unique features")
        , Chapter(title: "Layouts", description: "ConstraintLayout and AutoLayout as an approach of interface building")
        , Chapter(title: "Functions", description: "Functions syntax, usage. Lambdas and high-level functions.")
        , Chapter(title: "Collections", description: "Short brief about collections types and their usage")]
    
    func getChapter(_ title: String) -> Chapter {
        return chapters.first(where: {
            $0.title == title
        })!
    }
    
    func getChapters() -> Array<Chapter> {
        return chapters
    }


}
