//
//  ChapterDetailInteractor.swift
//  IOSViperSample
//
//  Created by Ivan Phytsyk on 10/3/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class ChapterDetailsInteractor: BaseInteractor<String, Chapter> {
    private let chaptersRepository: ChapterRepository
    
    init(_ executionQueue: DispatchQueue, _ resultQueue: DispatchQueue, _ chaptersRepository: ChapterRepository) {
        self.chaptersRepository = chaptersRepository
        super.init(executionQueue: executionQueue, resultQueue: resultQueue)
    }
    
    override func execute(_ input: String?) throws -> Chapter? {
        return chaptersRepository.getChapter(input!)
    }
}
