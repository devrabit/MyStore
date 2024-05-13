//
//  HomeProtocols.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

protocol ViewToPresenterHomeProtocol : AnyObject {
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func startFetchingProducts(query: String)
    func openSeeker(navigationController: UINavigationController)
    func showProducDetail(product: Product, navigation: UINavigationController)
}

protocol PresenterToViewHomeProtocol: AnyObject {
    func onProductResponseSuccess(producList: Array<Product>)
    func onMovieResponseFailed(error: String)
}

protocol PresenterToRouterHomeProtocol: AnyObject {
    static func createModule() -> HomeViewController
    func openSeeker(delegate: HomePresenter, navigationController: UINavigationController)
    func pushProductDetail(product: Product, navigationController: UINavigationController)
}

protocol PresenterToInteractorHomeProtocol: AnyObject {
    var presenter:InteractorToPresenterHomeProtocol? {get set}
    func fetchProducts(query: String)
}

protocol InteractorToPresenterHomeProtocol: AnyObject {
    func productFetchSuccess(producList: Array<Product>)
    func productFetchFailed(error: String)
}
