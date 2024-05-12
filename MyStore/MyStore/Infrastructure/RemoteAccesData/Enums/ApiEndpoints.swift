//
//  ApiEndpoints.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

enum ApiEndpoints {

    case searchItems(query: String)
    
    var url: URL {
        switch self {
        case .searchItems(let query):
            return URL(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(query)")!
        }
    }
    
}
