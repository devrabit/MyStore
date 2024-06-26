//
//  ProductDetailViewController.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

class ProductDetailViewController: UIViewController {
    var table: UITableView!
    
    //in this enumerator find all .xibs names
    enum NibIds: String {
        case productPrice = "ProductPrice"
        case attributeProductCell = "AttributeProductCell"
        case productImage = "ProductImage"
        case productSectionTitle = "ProductSectionTitle"
    }
    
    var presenter: ViewToPresenterProductDetailProtocol?
    var product: Product?
    var container: [ProductDetailCellModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        initFunctions()
    }
    
    func setUpView() {
        view.backgroundColor = .systemBackground
                
        table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(table)
        
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    /**
     this function execute all initial methods
     */
    func initFunctions() {
        inflateTable()
        registerCells()
        getProduct()
    }
    
    func inflateTable() {
        presenter?.getRowsTable()
    }
    
    func getProduct() {
        presenter?.getProductDetail()
    }
    
    /**
     here registers all Nibs before use in the table
     */
    func registerCells() {
        
        table.register(ProductSectionTitleTableViewCell.self, forCellReuseIdentifier: NibIds.productSectionTitle.rawValue)
        table.register(ProductImageTableViewCell.self, forCellReuseIdentifier: NibIds.productImage.rawValue)
        table.register(ProductPriceTableViewCell.self, forCellReuseIdentifier: NibIds.productPrice.rawValue)
        table.register(ProductAttributeTableViewCell.self, forCellReuseIdentifier: NibIds.attributeProductCell.rawValue)
        
    }
}
extension ProductDetailViewController: PresenterToViewProductDetailProtocol {
    func getDataTable(container: [ProductDetailCellModel]) {
        self.container = container
    }
    
    func getProduct(product: Product?) {
        self.product = product
    }
}

extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = container[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellId.rawValue, for: indexPath) as! ProductDetailGenericCellProtocol
        
        cell.setUp(item: item)
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return container.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = container[indexPath.row]
        return CGFloat(item.height)
    }
}

