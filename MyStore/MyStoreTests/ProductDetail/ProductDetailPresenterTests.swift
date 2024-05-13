//
//  ProductDetailPresenterTests.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
import XCTest
@testable import MyStore

class ProductDetailPresenterTests: XCTestCase {

    var mockView: ProductDetailMockView!
    var mockRouter: ProductDetailMockRouter!
    var mockInteractor: ProductDetailInteractor!
    var sut: ProductDetailPresenter!
    
    override func setUp(){
        super.setUp()
        mockView = ProductDetailMockView()
        mockRouter = ProductDetailMockRouter()
        mockInteractor = ProductDetailInteractor()
        sut = ProductDetailPresenter()
        sut.view = mockView
        sut.router = mockRouter
        sut.interactor = mockInteractor
    }
    
    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        sut = nil
    }
    
    func test_getProductDetail(){
        //Given
        let expected: [ProductDetailMockView.Invocations] = [.getProductCalled]
        //When
        sut.getProductDetail()
        //Then
        XCTAssertEqual(mockView.invocations, expected)
    }
    
    func test_getRowsTable(){
        //Given
        let expected: [ProductDetailMockView.Invocations] = [.getDataTableCalled]
        //When
        sut.getRowsTable()
        //Then
        XCTAssertEqual(mockView.invocations, expected)
    }
    
}
