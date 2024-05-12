//
//  Product.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation
struct Product {
    var id: String
    var title: String
    var price: Double
    var originalPrice: Double
    var thumbnail: String
    var attributes: [Attribute]
    
    func getPrice() -> String {
        formatPrice(numberToFormat: price)
    }
    
    func getOriginalPrice() -> String {
        formatPrice(numberToFormat: originalPrice)
    }
    
    private func formatPrice(numberToFormat: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0 // Esto quita los dígitos decimales

        if let formattedNumber = formatter.string(from: NSNumber(value: price)) {
           return "$" + formattedNumber
        }
        
        return "$0"
    }
    
    struct Attribute {
        var name: String
        var value_name: String
    }
}

