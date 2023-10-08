//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import UIKit
import SnapKit

class AuthController: UIViewController {
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnScren))
        return tapGesture
    }()
    
    var passwordTextfield: UITextField  = {
        let textfield = UITextField()
        textfield.textColor = .white
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = K.color.backgroundCell
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textfield
    }()
    
    var loginTextField: UITextField  = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.textColor = .white
        textfield.backgroundColor = K.color.backgroundCell
        textfield.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textfield
    }()
    
    var nameAppLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Rick and Morty"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    var portalmage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = K.image.portal
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var statusAuth: UILabel = {
       let label = UILabel()
        label.text = "Регистарция"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(portalmage)
        self.view.addSubview(statusAuth)
        self.view.backgroundColor = K.color.background
        self.view.addGestureRecognizer(tapGesture)
        setupConstraints()
    }
    
    func setupConstraints(){
        
        let stackView = UIStackView(arrangedSubviews: [nameAppLabel,loginTextField,passwordTextfield])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view).inset((UIEdgeInsets(top: 100, left: 10, bottom: 0, right: 10)))
            make.height.equalTo(220)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextfield.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        portalmage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(stackView.snp.bottom).offset(50)
            make.height.width.equalTo(self.view.frame.width / 2)
        }
        
        statusAuth.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.left.right.equalTo(self.view)
        }
    }
    
    @objc func tapOnScren(){
        loginTextField.endEditing(true)
        passwordTextfield.endEditing(true)
    }
}


