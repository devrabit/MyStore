//
//  SeekerPresenterTests.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import XCTest
@testable import MyStore

class SeekerPresenterTests: XCTestCase {
    var mockView: SeekerMockView!
    var mockRouter: SeekerMockRouter!
    var mockInteractor: SeekerMockInteractor!
    var sut: SeekerPresenter!
    
    override func setUp(){
        super.setUp()
        mockView = SeekerMockView()
        mockRouter = SeekerMockRouter()
        mockInteractor = SeekerMockInteractor()
        sut = SeekerPresenter()
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
    
    func test_validateQuery(){
        //Given
        let expected: [SeekerMockView.Invocations] = [.validateQueryCalled]
        //When
        sut.validateQuery(text: "")
        //Then
        XCTAssertEqual(expected, mockView.invocations)
    }
    
    func test_goToHome(){
        //Given
        let expected: [SeekerMockRouter.Invocations] = [.disapearToHomeCalled]
        //When
        sut.goToHome(query: "", view: HomeViewController())
        //Then
        XCTAssertEqual(expected, mockRouter.invocations)
    }
}

