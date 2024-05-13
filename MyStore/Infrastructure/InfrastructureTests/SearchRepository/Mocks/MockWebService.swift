//
//  MockWebService.swift
//  InfrastructureTests
//
//  Created by Andrey Carreño on 12/05/24.
//

import XCTest
@testable import Infrastructure

class MockWebService: WebServiceProtocol {
    var response: Result<Data, Error>?
    
    func get(_ endpoint: ApiEndpoints, completion: @escaping (Result<Data, Error>) -> Void) {
        if let response = response {
            completion(response)
        }
    }
}
