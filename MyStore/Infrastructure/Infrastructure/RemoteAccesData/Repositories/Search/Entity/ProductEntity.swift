//
//  ProductEntity.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation
public struct ProductEntity: Codable {
    public var id: String?
    public var site_id: String?
    public var title: String?
    public var price: Double?
    public var sale_price: String?
    public var currency_id: String?
    public var available_quantity: Int?
    public var sold_quantity: Int?
    public var buying_mode: String?
    public var listing_type_id: String?
    public var stop_time: String?
    public var condition: String?
    public var permalink: String?
    public var thumbnail: String?
    public var thumbnail_id: String?
    public var accepts_mercadopago: Bool?
    public var attributes: [AttributeEntity]
    public var original_price: Double?
    public var category_id: String?
    public var official_store_id: Int?
    public var domain_id: String?
    public var catalog_product_id: String?
    public var tags: [String]?
    public var catalog_listing: Bool?
    public var use_thumbnail_id: Bool?
    public var order_backend: Int?
    
    public init(id: String? = nil, site_id: String? = nil, title: String? = nil, price: Double? = nil, sale_price: String? = nil, currency_id: String? = nil, available_quantity: Int? = nil, sold_quantity: Int? = nil, buying_mode: String? = nil, listing_type_id: String? = nil, stop_time: String? = nil, condition: String? = nil, permalink: String? = nil, thumbnail: String? = nil, thumbnail_id: String? = nil, accepts_mercadopago: Bool? = nil, attributes: [AttributeEntity], original_price: Double? = nil, category_id: String? = nil, official_store_id: Int? = nil, domain_id: String? = nil, catalog_product_id: String? = nil, tags: [String]? = nil, catalog_listing: Bool? = nil, use_thumbnail_id: Bool? = nil, order_backend: Int? = nil) {
        self.id = id
        self.site_id = site_id
        self.title = title
        self.price = price
        self.sale_price = sale_price
        self.currency_id = currency_id
        self.available_quantity = available_quantity
        self.sold_quantity = sold_quantity
        self.buying_mode = buying_mode
        self.listing_type_id = listing_type_id
        self.stop_time = stop_time
        self.condition = condition
        self.permalink = permalink
        self.thumbnail = thumbnail
        self.thumbnail_id = thumbnail_id
        self.accepts_mercadopago = accepts_mercadopago
        self.attributes = attributes
        self.original_price = original_price
        self.category_id = category_id
        self.official_store_id = official_store_id
        self.domain_id = domain_id
        self.catalog_product_id = catalog_product_id
        self.tags = tags
        self.catalog_listing = catalog_listing
        self.use_thumbnail_id = use_thumbnail_id
        self.order_backend = order_backend
    }
}
