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

class ChapterDetalViewController: UIViewController, ChapterDetailsView {
    
    var chapter: Chapter? = nil
    
    func showChapterDetails(_ chapter: Chapter?) {
        self.chapter = chapter
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
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
