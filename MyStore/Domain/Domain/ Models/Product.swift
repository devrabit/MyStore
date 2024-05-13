//
//  Product.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation
public struct Product {
    public var id: String
    public var title: String
    public var price: Double
    public var originalPrice: Double
    public var thumbnail: String
    public var attributes: [Attribute]
    
    public init(id: String, title: String, price: Double, originalPrice: Double, thumbnail: String, attributes: [Attribute]) {
        self.id = id
        self.title = title
        self.price = price
        self.originalPrice = originalPrice
        self.thumbnail = thumbnail
        self.attributes = attributes
    }
    
    public func getPrice() -> String {
        formatPrice(numberToFormat: price)
    }
    
    public func getOriginalPrice() -> String {
        formatPrice(numberToFormat: originalPrice)
    }
    
    private func formatPrice(numberToFormat: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0 // Esto quita los dígitos decimales

        if let formattedNumber = formatter.string(from: NSNumber(value: numberToFormat)) {
           return "$" + formattedNumber
        }
        
        return "$0"
    }
    
    public struct Attribute {
        public var name: String
        public var value_name: String
        
        public init(name: String, value_name: String) {
            self.name = name
            self.value_name = value_name
        }
    }
}

