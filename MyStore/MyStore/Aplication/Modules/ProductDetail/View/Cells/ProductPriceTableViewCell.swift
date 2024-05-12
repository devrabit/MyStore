//
//  ProductPriceTableViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import UIKit

class ProductPriceTableViewCell: UITableViewCell, ProductDetailGenericCellProtocol {
    let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.4274, green: 0.4275, blue: 0.4274, alpha: 1.0)
        label.textAlignment = .left
        return label
    }()
    
    let lblPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    let lblOriginalPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.4274, green: 0.4275, blue: 0.4274, alpha: 1.0)
        label.textAlignment = .left
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUp(item: ProductDetailCellModel) {
        if case .price(
            let price,
            let oldPrice,
            let name) = item.obj {
            
            setUpPrice(price: price,
                       oldPrice: oldPrice,
                       name: name)
        }
        setUpView()
    }
    
    func setUpView() {
        contentView.addSubview(lblName)
        contentView.addSubview(lblPrice)
        contentView.addSubview(lblOriginalPrice)
        
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            lblName.topAnchor.constraint(equalTo: margins.topAnchor),
            lblName.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            lblName.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            lblPrice.topAnchor.constraint(equalTo: lblName.bottomAnchor),
            lblPrice.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            lblPrice.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            lblOriginalPrice.topAnchor.constraint(equalTo: lblName.bottomAnchor),
            lblOriginalPrice.leadingAnchor.constraint(equalTo: lblPrice.trailingAnchor, constant: 10),
            lblOriginalPrice.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            lblOriginalPrice.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
    
    private func setUpPrice(price: String, oldPrice: String, name: String) {
        lblName.text = name
        lblPrice.text = price
        lblOriginalPrice.text = oldPrice
    }
}
