//
//  HomeMockRouter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 13/05/24.
//

import Foundation
import UIKit
@testable import MyStore
@testable import Domain

class HomeMockRouter: PresenterToRouterHomeProtocol{
    enum Invocations {
        case openSeekerCalled
        case pushProductDetailCalled
    }
    
    var invocations: [Invocations] = []
    
    static func createModule() -> HomeViewController {
        return HomeViewController()
    }
    
    func openSeeker(delegate: HomePresenter, navigationController: UINavigationController) {
        invocations.append(.openSeekerCalled)
    }
    
    func pushProductDetail(product: Product, navigationController: UINavigationController) {
        invocations.append(.pushProductDetailCalled)
    }
}
