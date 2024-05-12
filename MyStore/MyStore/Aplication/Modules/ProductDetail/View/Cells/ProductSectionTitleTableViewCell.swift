//
//  ProductSectionTitleTableViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import UIKit

class ProductSectionTitleTableViewCell: UITableViewCell, ProductDetailGenericCellProtocol {
    
    let lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
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
        if case .title(text: let text) = item.obj {
            lblTitle.text = text
        }
        setUpView()
    }
    
    func setUpView() {
        // Añadir la etiqueta a la vista de contenido de la celda
        contentView.addSubview(lblTitle)
        
        // Configurar las restricciones
        NSLayoutConstraint.activate([
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            lblTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
}
