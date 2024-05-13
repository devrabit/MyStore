//
//  ProductTest.swift
//  DomainTests
//
//  Created by Andrey Carreño on 12/05/24.
//

import XCTest
@testable import Domain

final class ProductTest: XCTestCase {

    func testInit() {
            // Given
            let id = "123"
            let title = "iPhone"
            let price = 999.99
            let originalPrice = 1099.99
            let thumbnail = "iphone_thumbnail.jpg"
            let attributes = [Product.Attribute(name: "Color", value_name: "Black"),
                              Product.Attribute(name: "Capacity", value_name: "128GB")]
            
            //
            let product = Product(id: id, title: title, price: price, originalPrice: originalPrice, thumbnail: thumbnail, attributes: attributes)
            
            // Then
            XCTAssertEqual(product.id, id)
            XCTAssertEqual(product.title, title)
            XCTAssertEqual(product.price, price)
            XCTAssertEqual(product.originalPrice, originalPrice)
            XCTAssertEqual(product.thumbnail, thumbnail)
        }
        
        func testGetPrice() {
            // Given
            let product = Product(id: "123", title: "iPhone", price: 999.99, originalPrice: 1099.99, thumbnail: "iphone_thumbnail.jpg", attributes: [])
            
            // When
            let formattedPrice = product.getPrice()
            
            // Then
            XCTAssertEqual(formattedPrice, "$1,000")
        }
        
        func testGetOriginalPrice() {
            // Given
            let product = Product(id: "123", title: "iPhone", price: 999.99, originalPrice: 1099, thumbnail: "iphone_thumbnail.jpg", attributes: [])
            
            // When
            let formattedOriginalPrice = product.getOriginalPrice()
            
            // Then
            XCTAssertEqual(formattedOriginalPrice, "$1,099")
        }

}
