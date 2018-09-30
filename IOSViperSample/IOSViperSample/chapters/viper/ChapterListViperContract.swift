//
//  ViperContract.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/25/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

struct Chapter {
    let title: String
    let description: String
}

protocol ChapterRepository {
    func getChapters()-> Array<Chapter>
    func getChapter(_ id: String)-> Chapter
}

protocol ChapterListView {
    func showChapters(_ chapters: Array<Chapter>?)
    func showProgress(_ show: Bool)
    func showErrorMessage(_ message: String?)
}

protocol ChapterListPresenter {
    func start()
    func stop()
    func chapterItemClicked(_ chapter: Chapter)
}

protocol ChapterListRouter {
    func gotoChapter(_ chapter: Chapter)
    func exit()
}
