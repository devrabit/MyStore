//
//  HomeMockPresenter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
import XCTest
@testable import Application
@testable import Domain

class HomeMockPresenter: InteractorToPresenterHomeProtocol {
    
    enum Invocations {
        case productFetchSuccessCalled
        case productFetchFailedCalled
    }
    
    var invocations: [Invocations] = []
    var expectation: XCTestExpectation!
    
    
    func productFetchSuccess(producList: Array<Product>) {
        invocations.append(.productFetchSuccessCalled)
    }
    
    func productFetchFailed(error: String) {
        invocations.append(.productFetchFailedCalled)
    }
}
