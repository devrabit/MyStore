//
//  ProductDetailPresenter.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

class ProductDetailPresenter: ViewToPresenterProductDetailProtocol{
    var interactor: PresenterToInteractorProductDetailProtocol?
    var router: PresenterToRouterProductDetailProtocol?
    /// this var contain all information about product
    var product: Product?
    weak var view: PresenterToViewProductDetailProtocol?
    /**
     This function excute the method for pass information to the view
     */
    func getProductDetail() {
        view?.getProduct(product: product)
    }
    
    /**
     This function inflate the container for preduct detail table
     */
    
    func getRowsTable() {
        var container = [ProductDetailCellModel]()
        
        container.append(ProductDetailCellModel(
                            cellId: .productImage,
                            height: 250,
                            obj: .image(url: product?.thumbnail ?? "")
        ))
        container.append(ProductDetailCellModel(
                            cellId: .productPrice,
                            height: 139,
                            obj: .price(
                                price: product?.getPrice() ?? "",
                                oldPrice: product?.getOriginalPrice() ?? "",
                                name: product?.title ?? ""
                            )
        ))
        
        container.append(ProductDetailCellModel(
                            cellId: .productSectionTitle,
                            height: 60,
                            obj: .title(text: "Detalles del producto")
        ))
        
        let list = product?.attributes.map { (item) -> ProductDetailCellModel in
            return ProductDetailCellModel(cellId: .attributeProductCell, height: 39, obj: .attribute(key: item.name, value: item.value_name ))
            
        }
        container.append(contentsOf: list ?? [])
        view?.getDataTable(container: container)
    }
    
}

extension ProductDetailPresenter: InteractorToPresenterProductDetailProtocol{}
