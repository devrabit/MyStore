//
//  ProductDetailTableViewCell.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit

class ProductDetailTableViewCell: UITableViewCell  {
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblValue: UILabel?
    @IBOutlet weak var lblPrice: UILabel?
    @IBOutlet weak var lblOriginalPrice: UILabel?
    @IBOutlet weak var imgProduct: UIImageView?
    @IBOutlet weak var contentAttr: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        lblTitle?.text = nil
        lblName?.text = nil
        lblValue?.text = nil
        lblPrice?.text = nil
        lblOriginalPrice?.text = nil
        imgProduct?.image = nil
    }
    
    func setTup( item: ProductDetailCellModel){
        
        switch item.obj {
        case .attribute(let key, let value):
            setUpAttribute(key: key, value: value)
        case .price(let price, let oldPrice, let name):
            setUpPrice(price: price, oldPrice: oldPrice, name: name)
        case .image(let url):
            setUpImage(url: url)
        case .title(text: let text):
            setUpTitle(text: text)
        }
    }
    
    private func setUpAttribute(key: String, value: String) {
        lblName?.text = key
        lblValue?.text = value
        contentAttr?.addBoder()
    }
    
    private func setUpPrice(price: String, oldPrice: String, name: String) {
        lblName?.text = name
        lblPrice?.text = price
        lblOriginalPrice?.text = oldPrice
    }
    
    private func setUpImage(url: String) {
        imgProduct?.downloaded(from: url , contentMode: .scaleAspectFit)
    }
    
    private func setUpTitle(text: String) {
        lblTitle?.text = text
    }
}
