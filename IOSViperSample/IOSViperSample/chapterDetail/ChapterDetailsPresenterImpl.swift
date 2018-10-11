//
//  ChapterDetailsPresenterImpl.swift
//  IOSViperSample
//
//  Created by Ivan Phytsyk on 10/11/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class ChapterDetailsPresenterImpl: ChapterDetailsPresenter {
    private let chapterDetailsInteractor: ChapterDetailsInteractor
    private let view: ChapterDetailsView
    private let router: ChapterDetailsRouter
    private let chapterTitle: String
    
    init(_ chapterTitle: String,
         _ chapterDetailsInteractor: ChapterDetailsInteractor
        ,_ view: ChapterDetailsView
        ,_ router: ChapterDetailsRouter) {
        self.chapterTitle = chapterTitle
        self.chapterDetailsInteractor = chapterDetailsInteractor
        self.view = view
        self.router = router
    }
    
    func start() {
        chapterDetailsInteractor.execute(input: self.chapterTitle, {chapter in
            let viewModel = ChapterViewModel((chapter?.title)!, (chapter?.description)!, getIconForChapterType((chapter?.type)!))
            self.view.showChapterDetails(viewModel)
        }, {error in
            self.view.showErrorMessage(error.localizedDescription)
        }
        )
    
    }
    
    func stop() {
        chapterDetailsInteractor.cancel()
    }
    
    
}
