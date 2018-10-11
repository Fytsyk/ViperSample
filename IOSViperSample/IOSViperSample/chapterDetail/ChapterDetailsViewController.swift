//
//  ChapterDetailViewController.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 10/3/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

class ChapterDetailsViewController: UIViewController, ChapterDetailsView, ChapterDetailsRouter {

    @IBOutlet weak var chapterIconView: UIImageView!
    
    @IBOutlet weak var chapterTitleView: UILabel!
    
    private var chapter: ChapterViewModel? = nil
    
    @IBOutlet weak var chapterDescriptionView: UILabel!
    
    var chapterTitle: String? = nil
    
    private var presenter: ChapterDetailsPresenter? = nil
    
    override func viewDidLoad() {
        initPresenter()
        presenter?.start()
    }
    
    private func initPresenter() {
        let interactor = ChapterDetailsInteractor(DispatchQueue.global(),
                                               DispatchQueue.main,
                                               ChaptersRepositoryImpl())
        self.presenter = ChapterDetailsPresenterImpl(self.chapterTitle!, interactor, self, self)
        self.presenter?.start()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.presenter?.stop()
    }
    
    func showChapterDetails(_ chapter: ChapterViewModel?) {
        self.chapter = chapter
        self.chapterIconView.image = chapter?.image
        self.chapterTitleView.text = chapter?.title
        self.chapterDescriptionView.text = chapter?.description
    }
    
    func showProgress(_ show: Bool) {
        if show {
            HUD.show(.progress)
        } else{
            HUD.hide()
        }
    }
    
    func exit() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showErrorMessage(_ message: String?) {
        HUD.flash(.label(message))
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
