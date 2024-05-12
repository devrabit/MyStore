//
//  WebServiceProtocol.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

protocol WebServiceProtocol {
    func get(_ endpoint: ApiEndpoints, completion: @escaping (Result<Data, Error>) -> Void)
}
