//
//  ViewController.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 8/29/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import UIKit

class ChapterListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChapterListView, ChapterListRouter {
    
    private var items: [Chapter]? = []
    private var presenter: ChapterListPresenter?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.register(UINib(nibName: "ChapterCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")

        self.presenter?.start()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.presenter?.stop()
    }

    private func initPresenter() {
        let interactor = GetChaptersInteractor(DispatchQueue.global(),
                DispatchQueue.main,
                ChaptersRepositoryImpl())
        self.presenter = ChapterListPresenterImpl(interactor, self, self)
    }

    func showChapters(_ chapters: Array<Chapter>?) {
        self.items = chapters
        self.tableView.reloadData()
    }

    func showProgress(_ show: Bool) {

    }

    func showErrorMessage(_ message: String?) {

    }

    func openChapterDetails(_ chapter: Chapter) {

    }

    func exit() {

    }
    
    func gotoChapter(_ chapter: Chapter) {
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items != nil ? self.items!.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as? ChapterCell

        cell?.itemTitle.text = items![indexPath.row].title
        cell?.itemDescription.text = items![indexPath.row].description

        return cell!
    }
}

