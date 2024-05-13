//
//  SearchResponseEntity.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

struct SearchResponseEntity: Codable {
    var site_id: String?
    var query: String?
    var results: [ProductEntity]?
}
