//
//  SeekerProtocol.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit

protocol ViewToPresenterSeekerProtocol : AnyObject {
    var view: PresenterToViewSeekerProtocol? {get set}
    var interactor: PresenterToInteractorSeekerProtocol? {get set}
    var router: PresenterToRouterSeekerProtocol? {get set}
    var delegate: PresenterToPresenterSeekerProtocol? {get set}
    func validateQuery(text: String)
    func goToHome(query: String, view: UIViewController)
}

protocol PresenterToViewSeekerProtocol: AnyObject {
    func validateQuery(isValid: Bool)
}

protocol PresenterToRouterSeekerProtocol: AnyObject {
    static func createModule(delegate: PresenterToPresenterSeekerProtocol) -> SeekerViewController
    func disapearToHome(query: String, view: UIViewController)
}

protocol PresenterToInteractorSeekerProtocol: AnyObject {
    var presenter: InteractorToPresenterSeekerProtocol? {get set}
}

protocol InteractorToPresenterSeekerProtocol: AnyObject {}

protocol PresenterToPresenterSeekerProtocol: AnyObject {
    func dissmiss( query: String)
}
