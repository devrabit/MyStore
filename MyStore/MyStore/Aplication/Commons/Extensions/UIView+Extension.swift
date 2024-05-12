//
//  UIView.swift
//  Beauty Cats
//
//  Created by Andrey Carreño on 20/02/24.

//

import Foundation
import UIKit

extension UIView{
    
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
    func addBoder(){
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.borderWidth=1
    }
    
    func addRadius(round:CGFloat){
        self.layoutIfNeeded()
        layer.cornerRadius = round
        layer.masksToBounds = true
    }
    
    func addLoading(){
        
    }
    
    func removeLoading(){
        self.subviews.forEach { (item) in
            item.removeFromSuperview()
        }
    }
    
}
