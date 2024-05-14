//
//  SeekerViewController.swift
//  MyStore
//
//  Created by Andrey Carreño on 11/05/24.
//

import Foundation
import UIKit
class SeekerViewController: UIViewController {
    
    let btnCancel: UIButton = {
        let button = UIButton(frame: CGRect(x: 322, y: 24, width: 84, height: 34))
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor.clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let txtSearch: UITextField = {
        let textField = UITextField(frame: CGRect(x: 47, y: 1, width: 263, height: 34))
        textField.placeholder = "Buscar"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.minimumFontSize = 17
        textField.textAlignment = .natural
        textField.contentHorizontalAlignment = .left
        textField.contentVerticalAlignment = .center
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let imgGlass: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 18, y: 10, width: 20.5, height: 15.5))
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = UIColor(red: 0.47058823529999999, green: 0.52156862749999999, blue: 0.56862745100000001, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    var presenter: ViewToPresenterSeekerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
        btnCancel.addTarget(self, action: #selector(tapCancel), for: .touchDown)
    }
    
    /** this function configure the componets in the seerker view */
    func setUpView(){
        presenter?.validateQuery(text: "")
        txtSearch.delegate = self
        txtSearch.returnKeyType = UIReturnKeyType.done
        txtSearch.becomeFirstResponder()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        
        let searchView = UIView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.backgroundColor = UIColor(red: 254/255, green: 255/255, blue: 0, alpha: 1)
        searchView.layer.cornerRadius = 10
        view.addSubview(searchView)
        
        let customView = CustomView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.backgroundColor = UIColor.white
        customView.layer.cornerRadius = 5
        searchView.addSubview(customView)
        
        customView.addSubview(txtSearch)
        customView.addSubview(imgGlass)
        searchView.addSubview(btnCancel)
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 78),
            
            customView.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 24),
            customView.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -(btnCancel.frame.width + 10)),
            customView.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -24),
            
            txtSearch.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 24),
            txtSearch.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 47),
            txtSearch.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -47),
            txtSearch.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -24),
            
            imgGlass.centerYAnchor.constraint(equalTo: txtSearch.centerYAnchor),
            imgGlass.widthAnchor.constraint(equalToConstant: 20.5),
            imgGlass.heightAnchor.constraint(equalToConstant: 15.5),
            imgGlass.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 5),
            btnCancel.centerYAnchor.constraint(equalTo: txtSearch.centerYAnchor),
            btnCancel.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -18)
        ])
    }
    
    /** excecute method for go to home module and pass query words*/
    @objc func tapSearch(){
        presenter?.goToHome(query: txtSearch.text!, view: self)
    }
    
    /**
     this function cancel searchin action
     */
    
    @objc func tapCancel( textfield: UITextField){
        presenter?.goToHome(query: txtSearch.text!, view: self)
    }
    
}
extension SeekerViewController: PresenterToViewSeekerProtocol{
    func validateQuery(isValid: Bool) {
        if isValid {
            presenter!.goToHome(query: txtSearch.text ?? "", view: self)
        }
    }
}
extension SeekerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.validateQuery(text: textField.text ?? "")
        
        return true
    }
}
