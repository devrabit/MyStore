//
//  ProductCollectionViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
import Domain

class ProductCollectionViewCell: UICollectionViewCell {
    
    var imgPublication: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    var lblName: UILabel  = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        label.numberOfLines = 0
        
        return label
    }()
    var lblPrice: UILabel = {
        let label = UILabel()
       
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        
        return label
    }()
    
    static let identifier = "ProductCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    
    override func prepareForReuse() {
        imgPublication.image = nil
        lblName.text = nil
        lblPrice.text = nil
    }
    
    private func setupViews() {
        contentView.addSubview(imgPublication)
        contentView.addSubview(lblName)
        contentView.addSubview(lblPrice)
        
        NSLayoutConstraint.activate([
            imgPublication.topAnchor.constraint(equalTo: contentView.topAnchor),
            imgPublication.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imgPublication.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgPublication.heightAnchor.constraint(equalToConstant: 154),
            
            lblName.topAnchor.constraint(equalTo: imgPublication.bottomAnchor, constant: 18),
            lblName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            lblName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            
            lblPrice.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 18),
            lblPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            lblPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            lblPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Additional setup
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    func setUp(product: Product){
        lblName.text = product.title
        lblPrice.text = product.getPrice()
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            imgPublication.downloaded(from: product.thumbnail, contentMode: .scaleAspectFit)
           
        }
    }
}
