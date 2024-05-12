//
//  ProductAttributeTableViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import UIKit

class ProductAttributeTableViewCell: UITableViewCell, ProductDetailGenericCellProtocol {
    
    let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    let lblValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .right
        return label
    }()
    
    let containerView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUp(item: ProductDetailCellModel) {
        if case .attribute(let key, let value) = item.obj {
            setUpAttribute(key: key, value: value)
        }
        setUpView()
    }
    
    func setUpView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        let stackView = UIStackView(arrangedSubviews: [lblName, lblValue])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            lblName.topAnchor.constraint(equalTo: containerView.topAnchor),
            lblName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            lblName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            lblValue.topAnchor.constraint(equalTo: containerView.topAnchor),
            lblValue.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            lblValue.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            lblValue.leadingAnchor.constraint(equalTo: lblName.trailingAnchor)
        ])
    }
    
    private func setUpAttribute(key: String, value: String) {
        lblName.text = key
        lblValue.text = value
        containerView.addBoder()
    }
}
