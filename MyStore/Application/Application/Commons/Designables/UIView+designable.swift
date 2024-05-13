//
//  UIView.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/02/24.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
    @IBInspectable var cornerRadiusValue: CGFloat = 10.0 {
        didSet {
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    func setUpView() {
        self.layer.cornerRadius = self.cornerRadiusValue
        self.clipsToBounds = true
    }
}
