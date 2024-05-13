//
//  ProductServicesMock.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

@testable import MyStore
import XCTest
class ProductServicesMock: ProductServicesProtocol {
    
    var delegate: MyStore.ProductServicesOuputDelegate?
    
    enum Invocations {
        case getProductsByQueryCalled
    }
    
    var invocations: [Invocations] = []
    
    func getProductsByQuery(with query: String) {
        (!query.isEmpty) ? delegate?.fetchProducts(products: []) : delegate?.fetchProductsFailed(error: "")
        invocations.append(.getProductsByQueryCalled)
    }
}
