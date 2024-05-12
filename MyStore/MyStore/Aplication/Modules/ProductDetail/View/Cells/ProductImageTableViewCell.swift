//
//  ProductDetailTableViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import UIKit

class ProductImageTableViewCell: UITableViewCell, ProductDetailGenericCellProtocol {
    
    let imgProduct: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        if case .image(let url) = item.obj {
            setUpImage(url: url)
        }
        setUpView()
    }
    
    func setUpView() {
        contentView.addSubview(imgProduct)
        
        NSLayoutConstraint.activate([
            imgProduct.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgProduct.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgProduct.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgProduct.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setUpImage(url: String) {
        imgProduct.downloaded(from: url , contentMode: .scaleAspectFit)
    }
    
}
