//
//  HomePresenterTests.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
import XCTest
@testable import MyStore
@testable import Domain

class HomePresenterTests: XCTestCase {

    var mockView: HomeMockView!
    var mockRouter: HomeMockRouter!
    var mockInteractor: HomeMockInteractor!
    var sut: HomePresenter!
    
    override func setUp(){
        super.setUp()
        mockView = HomeMockView()
        mockRouter = HomeMockRouter()
        mockInteractor = HomeMockInteractor()
        sut = HomePresenter()
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
    
    func test_startFetchingProducts(){
        //Given
        let expected: [HomeMockInteractor.Invocations] = [.fetchProductsCalled]
        //When
        sut.startFetchingProducts(query: "")
        //Then
        XCTAssertEqual(expected, mockInteractor.invocations)
    }
    
    func test_onProductResponseSuccess(){
        //Given
        let expected: [HomeMockView.Invocations] = [.onProductResponseSuccessCalled]
        //When
        sut.onProductResponseSuccess(producList: [])
        //Then
        XCTAssertEqual(expected, mockView.invocations)
    }
    
    func test_openSeeker(){
        //Given
        let expected: [HomeMockRouter.Invocations] = [.openSeekerCalled]
        //When
        sut.openSeeker(navigationController: UINavigationController())
        //Then
        XCTAssertEqual(expected, mockRouter.invocations)
    }
    
    func test_showProducDetail(){
        //Given
        let expected: [HomeMockRouter.Invocations] = [.pushProductDetailCalled]
        //When
        sut.showProducDetail(product:DummyData.product, navigation: UINavigationController())
        //Then
        XCTAssertEqual(expected, mockRouter.invocations)
    }
    
    struct DummyData {
        static let product = Product(id: "",
                                     title: "",
                                     price: 0,
                                     originalPrice: 0,
                                     thumbnail: "",
                                     attributes: [])
    }
}

