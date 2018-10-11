//
//  ViperContract.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/25/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation
import UIKit

struct Chapter {
    let title: String
    let description: String
    let type: ChapterType
}

class ChapterViewModel {
    var title: String?
    var description: String?
    var image: UIImage?
    
    init(_ title: String, _ description: String, _ image: UIImage?) {
        self.title = title
        self.description = description
        self.image = image
    }
}


protocol ChapterRepository {
    func getChapters()-> Array<Chapter>
    func getChapter(_ id: String)-> Chapter
}

protocol ChapterListView {
    func showChapters(_ chapters: Array<ChapterViewModel>?)
    func showProgress(_ show: Bool)
    func showErrorMessage(_ message: String?)
}

protocol ChapterListPresenter {
    func start()
    func stop()
    func chapterItemClicked(_ chapter: ChapterViewModel)
}

protocol ChapterListRouter {
    func openChapterDetails(_ chapterTitle: String)
    func exit()
}
