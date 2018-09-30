//
//  CellItem.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 8/29/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import UIKit

class CellItem {
     var title: String?
     var description: String?
     var image: String?
    
    init(_ title: String, _ description: String, _ image: String?) {
        self.title = title
        self.description = description
        self.image = image
    }
}
