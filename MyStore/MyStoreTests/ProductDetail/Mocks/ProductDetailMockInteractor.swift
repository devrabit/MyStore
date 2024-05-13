//
//  ProductDetailInteractorMock.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
@testable import MyStore

class ProductDetailInteractor: PresenterToInteractorProductDetailProtocol {
    var presenter: InteractorToPresenterProductDetailProtocol?
}
