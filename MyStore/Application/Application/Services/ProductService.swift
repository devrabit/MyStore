//
//  ProductService.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import Domain
import Infrastructure

protocol ProductServicesOuputDelegate: AnyObject {
    func fetchProducts(products: [Product])
    func fetchProductsFailed(error: String)
}

protocol ProductServicesProtocol: AnyObject {
    var delegate: ProductServicesOuputDelegate? { get set }
    func getProductsByQuery(with query: String)
}

class ProductService: ProductServicesProtocol {
    private let searchRepository: SearchRepositoryProtocol
    weak var delegate: ProductServicesOuputDelegate?
    
    init(searchRepository: SearchRepositoryProtocol = SearchRepository(webService: URLSesionWebService()), delegate: ProductServicesOuputDelegate?) {
        self.searchRepository = searchRepository
        self.delegate = delegate
    }
    
    func getProductsByQuery(with query: String) {
        searchRepository.searchItems(with: query) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let searchResponse):
                
                let mappedProducts = searchResponse.map { productEntity in
                    return Product(id: productEntity.id ?? "",
                                   title: productEntity.title ?? "",
                                   price: productEntity.price ?? 0,
                                   originalPrice: productEntity.original_price ?? 0,
                                   thumbnail: productEntity.thumbnail ?? "",
                                   attributes: productEntity.attributes.map({Product.Attribute(
                                    name: $0.name ?? "",
                                    value_name: $0.value_name ?? "")}))
                }
                delegate?.fetchProducts(products: mappedProducts)
            case .failure(let error):
                self.delegate?.fetchProductsFailed(error: error.localizedDescription)
            }
        }
    }
}
