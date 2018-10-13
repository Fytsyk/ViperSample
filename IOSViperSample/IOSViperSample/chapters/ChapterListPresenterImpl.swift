//
//  ChapterListPresenterImpl.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/25/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class ChapterListPresenterImpl: ChapterListPresenter {
    
    private let chapterListInteractor: GetChaptersInteractor
    private let view: ChapterListView
    private let router: ChapterListRouter
    
    init(_ chapterListInteractor: GetChaptersInteractor
        ,_ view: ChapterListView
        ,_ router: ChapterListRouter) {
        self.chapterListInteractor = chapterListInteractor
        self.view = view
        self.router = router
    }
    
    func start() {
        chapterListInteractor.execute({
            let viewModels = $0?.map({ (chapter) -> ChapterViewModel in
                ChapterViewModel(chapter.title, chapter.description, getIconForChapterType(chapter.type))
            })
            self.view.showChapters(viewModels)
        }) {
            self.view.showErrorMessage($0.localizedDescription)
        }
    }
    
    func stop() {
        chapterListInteractor.cancel()
    }
    
    func chapterItemClicked(_ chapter: ChapterViewModel) {
        router.openChapterDetails(chapter.title!)
    }
}
