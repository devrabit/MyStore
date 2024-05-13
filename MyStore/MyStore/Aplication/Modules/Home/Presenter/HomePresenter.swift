//
//  HomePresentation.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

class HomePresenter: ViewToPresenterHomeProtocol{
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    weak var view: PresenterToViewHomeProtocol?
    /**
     here start method for fetching producs
     :params:: query- Words for search products in mercadoLibre
     */
    func startFetchingProducts(query: String) {
        interactor?.fetchProducts(query: query)
    }
    /**
        in this function get the products and pass data to the view
        :params:: product list - later inflate collection view data
     */
    func onProductResponseSuccess(producList: Array<Product>){
        view?.onProductResponseSuccess(producList: producList)
    }
    
    /**
        in this function get the open seeker
        :params:: navigationController - navigation cotroller for present controller
     */
    func openSeeker(navigationController: UINavigationController){
        router?.openSeeker(delegate: self,navigationController: navigationController)
    }
    /**
        in this function show detail module
        :params:: navigationController - navigation cotroller for push controller, product - data about the selected product
        
     */
    func showProducDetail(product: Product, navigation: UINavigationController) {
        router?.pushProductDetail(product:product , navigationController: navigation)
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol{
    /**
        in this function get error in petition
        :params:: error - error from api
        
     */
    func productFetchFailed(error: String) {
        view?.onMovieResponseFailed(error: error)
    }
    /**
        in this function fetch products
        :params:: producList - array after inflate collection view
        
     */
    func productFetchSuccess(producList: Array<Product>) {
        view?.onProductResponseSuccess(producList: producList)
    }
    
}

extension HomePresenter: PresenterToPresenterSeekerProtocol{
    /** this function pass data to home presenter*/
    func dissmiss(query: String) {
        print(query)
        if query != "" {
            startFetchingProducts(query: query)
        }
    }
}
