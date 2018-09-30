//
//  ViperContract.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/29/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

//
//  ViperContract.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/25/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

protocol ChapterDetailsView {
    func showChapterDetails(_ chapter: Chapter?)
    func showProgress(_ show: Bool)
    func showErrorMessage(_ message: String?)
}

protocol ChapterDetailsPresenter {
    func start()
    func stop()
}

protocol ChapterDetailsRouter {
    func gotoChapter(_ chapter: Chapter)
    func exit()
}
