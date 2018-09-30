//
//  GetChaptersInteractor.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/25/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class GetChaptersInteractor: BaseInteractor<Any, Array<Chapter>> {

    private let chaptersRepository: ChapterRepository

    init(_ executionQueue: DispatchQueue, _ resultQueue: DispatchQueue, _ chaptersRepository: ChapterRepository) {
        self.chaptersRepository = chaptersRepository
        super.init(executionQueue: executionQueue, resultQueue: resultQueue)
    }


    override func execute(_ input: Any?) throws -> Array<Chapter>? {
        return chaptersRepository.getChapters()
    }


}
