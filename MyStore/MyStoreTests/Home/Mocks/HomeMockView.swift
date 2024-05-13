//
//  HomeMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
@testable import MyStore
@testable import Domain

class HomeMockView: PresenterToViewHomeProtocol {
    enum Invocations {
        case onProductResponseSuccessCalled
        case onMovieResponseFailedCalled
    }
    
    var invocations: [Invocations] = []
    
    func onProductResponseSuccess(producList: Array<Product>) {
        invocations.append(.onProductResponseSuccessCalled)
    }
    
    func onMovieResponseFailed(error: String) {
        invocations.append(.onMovieResponseFailedCalled)
    }
}
