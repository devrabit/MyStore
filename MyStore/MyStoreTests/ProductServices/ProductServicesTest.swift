//
//  ProductServicesTest.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
import XCTest
@testable import MyStore

class ProductServicesTest: XCTestCase {
    var mockRepository: SearchRepositoryMock!
    var mockInteractor: HomeMockInteractor!
    var sut: ProductService!
    
    override func setUp(){
        super.setUp()
        mockRepository = SearchRepositoryMock()
        mockInteractor = HomeMockInteractor()
        sut = ProductService(searchRepository: mockRepository, delegate: mockInteractor)
    }
    
    override func tearDown() {
        super.tearDown()
        mockInteractor = nil
        sut = nil
    }
    
    func testFetchProductsFailed() {
        let expected: [HomeMockInteractor.Invocations] = [.fetchProductsFailed]
        //When
        sut.getProductsByQuery(with: "")
        //Then
        XCTAssertEqual(expected, mockInteractor.invocations)
    }
    
    func testFetchProductsSucces() {
        let expected: [HomeMockInteractor.Invocations] = [.fetchProductsSucces]
        //When
        sut.getProductsByQuery(with: "test")
        //Then
        XCTAssertEqual(expected, mockInteractor.invocations)
    }
    
    func test_startFetchingProducts(){
        //Given
        let expected: [SearchRepositoryMock.Invocations] = [.searchItems]
        //When
        sut.getProductsByQuery(with: "")
        //Then
        XCTAssertEqual(expected, mockRepository.invocations)
    }    
    
}


