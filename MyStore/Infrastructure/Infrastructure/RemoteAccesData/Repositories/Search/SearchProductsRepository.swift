//
//  SearchProductsRepository.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

public protocol SearchRepositoryProtocol {
    func searchItems(with query: String, completion: @escaping (Result<[ProductEntity], RepositoryError>) -> Void)
}

public class SearchRepository: SearchRepositoryProtocol {
    public let webService: WebServiceProtocol
    public init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    public func searchItems(with query: String, completion: @escaping (Result<[ProductEntity], RepositoryError>) -> Void) {
        webService.get(.searchItems(query: query)) { result in
            switch result {
            case .success(let data):
                do {
                    let reponse = try JSONDecoder().decode(SearchResponseEntity.self, from: data)
                    completion(.success(reponse.results ?? []))
                } catch {
                    completion(.failure(.networkError(error)))
                }
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
}
