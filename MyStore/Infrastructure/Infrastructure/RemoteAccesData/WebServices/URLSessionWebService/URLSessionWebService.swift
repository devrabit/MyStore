//
//  URLSessionWebService.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

public class URLSesionWebService: WebServiceProtocol {
    public init() {
        
    }
    
    public func get(_ endpoint: ApiEndpoints, completion : @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: endpoint.url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard response is HTTPURLResponse else {
                    fatalError("Unsupported protocol")
                }
                if let data = data {
                    completion(.success(data))
                }
            }
        }.resume()
    }
}
