//
//  ProductDetailMockRouter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

@testable import Application
@testable import Domain

class ProductDetailMockRouter: PresenterToRouterProductDetailProtocol {
    
    enum Invocations {
        case createModuleCalled
    }
    
    var invocations: [Invocations] = []
    
    static func createModule(product: Product) -> ProductDetailViewController {
        ProductDetailViewController()
    }
}
