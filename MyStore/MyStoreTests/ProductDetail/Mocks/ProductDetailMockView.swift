//
//  ProductDetailMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

@testable import MyStore
@testable import Domain

class ProductDetailMockView: PresenterToViewProductDetailProtocol {
    
    enum Invocations {
        case getProductCalled
        case getDataTableCalled
    }
    
    var invocations: [Invocations] = []
    
    func getProduct(product: Product?) {
        invocations.append(.getProductCalled)
    }
    
    func getDataTable(container: [ProductDetailCellModel]) {
        invocations.append(.getDataTableCalled)
    }
}
