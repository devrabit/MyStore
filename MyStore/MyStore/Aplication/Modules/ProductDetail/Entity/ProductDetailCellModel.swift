//
//  ProductDetailCellModel.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
struct ProductDetailCellModel {
    enum CellsIds: String {
        case productPrice = "ProductPrice"
        case attributeProductCell = "AttributeProductCell"
        case productImage = "ProductImage"
        case productSectionTitle = "ProductSectionTitle"
    }
    
    enum CellsObj {
        case price(price: String, oldPrice: String, name: String)
        case image(url: String)
        case attribute(key: String, value: String)
        case title(text: String)
    }
    
    var cellId: CellsIds
    var height: Int
    var obj: CellsObj
}
