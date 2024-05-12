//
//  HomeInteractor.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
class HomeInteractor: PresenterToInteractorHomeProtocol {
    weak var presenter: InteractorToPresenterHomeProtocol?
    var productService: ProductServicesProtocol?
    
    init() {
        productService = ProductService(delegate: self)
    }
    
    func fetchProducts(query: String) {
        productService?.getProductsByQuery(with: query)
    }
}
extension HomeInteractor: ProductServicesOuputDelegate {
    func fetchProducts(products: [Product]) {
        self.presenter?.productFetchSuccess(producList: products)
    }
    
    func fetchProductsFailed(error: String) {
        presenter?.productFetchFailed(error: error)
    }
}
