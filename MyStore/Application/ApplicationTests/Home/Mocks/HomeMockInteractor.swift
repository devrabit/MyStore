//
//  HomeMockInteractor.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
@testable import Application
@testable import Domain

class HomeMockInteractor: PresenterToInteractorHomeProtocol {
    enum Invocations {
        case fetchProductsCalled
        case fetchProductsSucces
        case fetchProductsFailed
    }
    
    var invocations: [Invocations] = []
    var presenter: InteractorToPresenterHomeProtocol?
    
    func fetchProducts(query: String) {
        invocations.append(.fetchProductsCalled)
    }
}
extension HomeMockInteractor: ProductServicesOuputDelegate {
    func fetchProducts(products: [Domain.Product]) {
        invocations.append(.fetchProductsSucces)
    }
    
    func fetchProductsFailed(error: String) {
        invocations.append(.fetchProductsFailed)
    }
}
