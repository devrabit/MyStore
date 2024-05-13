//
//  SearchRepositoryMock.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
@testable import MyStore
@testable import Infrastructure

class SearchRepositoryMock: SearchRepositoryProtocol {
    
    enum Invocations {
        case searchItems
    }
    var invocations: [Invocations] = []
    
    func searchItems(with query: String, completion: @escaping (Result<[Infrastructure.ProductEntity], Infrastructure.RepositoryError>) -> Void) {

        invocations.append(.searchItems)
        if !query.isEmpty {
            completion(.success(Infrastructure.SearchResponseEntity().results ?? []))
        } else {
            completion(.failure(.genericError))
        }
    }
    
}
