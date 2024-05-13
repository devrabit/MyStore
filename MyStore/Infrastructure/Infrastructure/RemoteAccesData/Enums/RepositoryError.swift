//
//  Errors.swift
//  MyStore
//
//  Created by Andrey Carreño on 10/05/24.
//

import Foundation

public enum RepositoryError: Error {
    case networkError(Error)
    case genericError
}
