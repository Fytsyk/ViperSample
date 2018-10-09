//
//  ViewController.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 8/29/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import UIKit
import PKHUD

class ChapterListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChapterListView, ChapterListRouter {
    
    private var items: [ChapterViewModel]? = []
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

    func showChapters(_ chapters: Array<ChapterViewModel>?) {
        self.items = chapters
        self.tableView.reloadData()
    }

    func showProgress(_ show: Bool) {
        if show {
            HUD.show(.progress)
        } else{
            HUD.hide()
        }
    }
    
    func showErrorMessage(_ message: String?) {
        HUD.flash(.label(message))
    }

    func openChapterDetails(_ chapter: ChapterViewModel) {
        performSegue(withIdentifier: "showChapterDetailsSegue", sender: chapter)
    }

    func exit() {
        self.dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items != nil ? self.items!.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as? ChapterCell

        let chapter = items![indexPath.row]
        cell?.itemTitle.text = chapter.title
        cell?.itemDescription.text = chapter.description
        cell?.itemImage.image = chapter.image

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chapter = items![indexPath.row]
        self.presenter?.chapterItemClicked(chapter)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChapterDetailsSegue" {
        let viewController = segue.destination as! ChapterDetalViewController
        viewController.chapter = sender as? Chapter
        }
    }
}

