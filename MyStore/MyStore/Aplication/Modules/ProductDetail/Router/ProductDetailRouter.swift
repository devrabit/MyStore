//
//  ProductDetailRouter.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

class ProductDetailRouter: PresenterToRouterProductDetailProtocol{
    /// this var get the  product detail storyboard
    static var storyboard: UIStoryboard{
        return UIStoryboard(name:"ProductDetail", bundle: Bundle.main)
    }
    /** instantiate the product detail module*/
    static func createModule(product: Product) -> ProductDetailViewController {
        let view = ProductDetailViewController()
        
        let presenter: ViewToPresenterProductDetailProtocol & InteractorToPresenterProductDetailProtocol = ProductDetailPresenter()
        let interactor: PresenterToInteractorProductDetailProtocol = ProductDetailInteractor()
        let router: PresenterToRouterProductDetailProtocol = ProductDetailRouter()
    
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.product = product
        interactor.presenter = presenter
        
        return view
    }
}
