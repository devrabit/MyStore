//
//  SeekerPresenter.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit

class SeekerPresenter: ViewToPresenterSeekerProtocol{
    // var is later use for pass data whe dissmiss view/
    var delegate: PresenterToPresenterSeekerProtocol?
    var interactor: PresenterToInteractorSeekerProtocol?
    var router: PresenterToRouterSeekerProtocol?
    weak var view: PresenterToViewSeekerProtocol?
    /**
     this function validate text query
     :params: text - query words
     */
    func validateQuery(text: String) {
        view?.validateQuery(isValid: (text != "" ? true : false))
    }
    /** this function dissmiss the popUp secker and pass text query to the home view presenter*/
    func goToHome(query: String, view: UIViewController) {
        router?.disapearToHome(query: query, view: view)
        delegate?.dissmiss(query: query)
    }
    
}

extension SeekerPresenter: InteractorToPresenterSeekerProtocol{}
