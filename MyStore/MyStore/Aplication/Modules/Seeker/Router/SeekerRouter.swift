//
//  SeekerRouter.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit

class SeekerRouter: PresenterToRouterSeekerProtocol {
    
    var delegate: PresenterToPresenterSeekerProtocol?
    /// this var get the seeker's storyboard
    static var storyboard: UIStoryboard{
        return UIStoryboard(name:"Seeker",bundle: Bundle.main)
    }
    
    /** instantiate the seeker´s module*/
    static func createModule(delegate: PresenterToPresenterSeekerProtocol) -> SeekerViewController {
        let view = SeekerViewController()
        let presenter: ViewToPresenterSeekerProtocol & InteractorToPresenterSeekerProtocol = SeekerPresenter()
        let interactor: PresenterToInteractorSeekerProtocol = SeekerInteractor()
        let router: PresenterToRouterSeekerProtocol = SeekerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.delegate = delegate.self
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func disapearToHome(query: String, view: UIViewController) {
        delegate?.dissmiss(query: query)
        view.dismiss(animated: true, completion: nil)
    }
    
}
