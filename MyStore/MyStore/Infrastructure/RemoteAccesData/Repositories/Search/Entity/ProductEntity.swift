//
//  ProductEntity.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation
struct ProductEntity: Codable {
    var id: String?
    var site_id: String?
    var title: String?
    var price: Double?
    var sale_price: String?
    var currency_id: String?
    var available_quantity: Int?
    var sold_quantity: Int?
    var buying_mode: String?
    var listing_type_id: String?
    var stop_time: String?
    var condition: String?
    var permalink: String?
    var thumbnail: String?
    var thumbnail_id: String?
    var accepts_mercadopago: Bool?
    var attributes: [AttributeEntity]
    var original_price: Double?
    var category_id: String?
    var official_store_id: Int?
    var domain_id: String?
    var catalog_product_id: String?
    var tags: [String]?
    var catalog_listing: Bool?
    var use_thumbnail_id: Bool?
    var order_backend: Int?
}
