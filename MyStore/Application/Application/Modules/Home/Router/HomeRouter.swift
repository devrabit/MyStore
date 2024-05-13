//
//  HomeRouter.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

public class HomeRouter: PresenterToRouterHomeProtocol {
    
    /** instantiate the home´s module*/
    public static func createModule() -> HomeViewController {
        let view = HomeViewController()
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        let interactor: PresenterToInteractorHomeProtocol = HomeInteractor()
        let router: PresenterToRouterHomeProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    /** open seeker module*/
    func openSeeker(delegate: HomePresenter, navigationController: UINavigationController) {
        let view = SeekerRouter.createModule(delegate: delegate)

        navigationController.present(view, animated: true, completion: nil)
    }
    /** go to detail product*/
    func pushProductDetail(product: Product, navigationController: UINavigationController) {
        let view = ProductDetailRouter.createModule(product: product)

        navigationController.pushViewController(view, animated: true)
    }
}
