//
//  BaseInteractor.swift
//  TestTableView
//
//  Created by Ivan Phytsyk on 9/23/18.
//  Copyright © 2018 Ivan Phytsyk. All rights reserved.
//

import Foundation

class BaseInteractor<INPUT, OUTPUT> {
    
    private var input: INPUT? = nil
    private let executionQueue: DispatchQueue
    private let resultQueue: DispatchQueue
    
    private var onResult: ((OUTPUT?) -> Void)?
    private var onError: ((Error) -> Void)?
    private var workItem: DispatchWorkItem?
    
    init(executionQueue: DispatchQueue,
         resultQueue: DispatchQueue) {
        self.executionQueue = executionQueue
        self.resultQueue = resultQueue
    }
    
    func execute(_ input: INPUT?) throws -> OUTPUT? {
        fatalError("Need to be implemented in subclass")
    }
    
    func execute(input: INPUT? = nil, _ onResult: @escaping (OUTPUT?) -> Void, _ onError: @escaping (Error) -> Void) {
        self.input = input
        self.onResult = onResult
        self.onError = onError
        self.workItem = DispatchWorkItem {self.executeSafe()}
        executionQueue.async(execute: self.workItem!)
    }
    
    func cancel() {
        self.onResult = nil
        self.onError = nil
        self.workItem?.cancel()
    }
    
    private func executeSafe() {
        do {
            let result = try execute(input)
            runInResultQueue { self.onResult?(result) }
        } catch {
            runInResultQueue { self.onError?(error) }
        }
    }
    
    private func runInResultQueue(block: @escaping () -> Void) {
        resultQueue.async {
            block()
        }
    }
}
