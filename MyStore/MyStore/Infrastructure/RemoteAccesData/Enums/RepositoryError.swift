//
//  Errors.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

enum RepositoryError: Error {
    case networkError(Error)
    case genericError
}
