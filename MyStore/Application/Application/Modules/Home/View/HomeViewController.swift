//
//  HomeView.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

public class HomeViewController: UIViewController {
    var collectionView: UICollectionView!
    // in container is find all information about products/
    var container: Array<Product> = Array()
    var presenter: ViewToPresenterHomeProtocol?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        initFunctions()
        // Do any additional setup after loading the view.
    }
    
    /**this functions initialize all methods*/
    func initFunctions(){
        setUpHeader()
        setUpView()
        
        presenter?.startFetchingProducts(query: "tel")
    }
    
    func setUpView() {
        // Main view
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .systemBackground
        view.addSubview(mainView)
        
        // Collection View
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 128, height: 128)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self

        mainView.addSubview(collectionView)
        
        // Constraints for collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
        
        // Constraints for mainView
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        registerCells()
    }
    
    func setUpHeader() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  UIColor(red: 255, green: 209, blue: 0, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(openSeeker))
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.backgroundColor = UIColor(red: 255, green: 209, blue: 0, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isOpaque = false
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance =  navigationController?.navigationBar.standardAppearance
    }
    
    /** here register (Nibs) for before use the table*/
    func registerCells(){
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    /** this function excecute open seeker method*/
    @objc func openSeeker() {
        
        presenter?.openSeeker(navigationController: self.navigationController!)
        
    }

}
extension HomeViewController: PresenterToViewHomeProtocol{
    /** this function receive data about of products in the query*/
    func onProductResponseSuccess(producList: Array<Product>) {
        container = producList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    /** this function receive the error in service*/
    func onMovieResponseFailed(error: String) {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching products   ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        container.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = container[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell.setUp(product: item)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showProducDetail(product: container[indexPath.row], navigation: self.navigationController!)
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 265
        let width: CGFloat = CGFloat(collectionView.frame.width / 2 - 10)
        
        return CGSize(width: width, height: height)
    }
}
