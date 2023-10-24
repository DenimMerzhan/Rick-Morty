//
//  ViewController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import UIKit
import SnapKit

class AuthController: RickAndMortyController {
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnScren))
        return tapGesture
    }()
    
    private var passwordTextfield: UITextField  = {
        let textfield = UITextField()
        textfield.textColor = .white
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = Context.color.backgroundCell
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textfield
    }()
    
    private var loginTextField: UITextField  = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.textColor = .white
        textfield.backgroundColor = Context.color.backgroundCell
        textfield.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textfield
    }()
    
    private lazy var authButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(authPressed), for: .touchUpInside)
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var nameAppLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Rick and Morty"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func startConfing() {
        self.view.addSubview(portalImage)
        self.view.addSubview(authButton)
        self.view.addGestureRecognizer(tapGesture)
    }

    override func setupConstraints(){
        
        let stackView = UIStackView(arrangedSubviews: [nameAppLabel,loginTextField,passwordTextfield])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view).inset((UIEdgeInsets(top: 100, left: 10, bottom: 0, right: 10)))
            make.height.equalTo(270)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextfield.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        authButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
            make.width.equalTo(180)
        }
        
        portalImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(authButton.snp.bottom).offset(50)
            make.height.width.equalTo(self.view.frame.width / 2)
        }
        
    }
    
    @objc func tapOnScren(){
        loginTextField.endEditing(true)
        passwordTextfield.endEditing(true)
    }
    
    @objc func authPressed(){
        
        guard let password = passwordTextfield.text, let login = loginTextField.text else {return}
        let credentials = KeychainManager.Credintials(login: login, password: password)
        do {
            try KeychainManager.shared.addCredentials(credentials, withKey: UserService.shared.keyChainUserKey)
            perfomSegueToMainVC()
        }catch {
            let alert = createErrorAlert(errorMessage: "\(error)")
            self.present(alert, animated: true)
        }
    }
}

//MARK: - perfomSegueToMainVC, checkIsUserAuth

extension AuthController {
    
    func perfomSegueToMainVC() {
        loginTextField.text = ""
        passwordTextfield.text = ""
        
        let mainTabBarVC = MainTabBarController()
        
        let logOutVC = LogOutController()
        let homeVC = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        
        mainTabBarVC.setViewControllers([homeVC,logOutVC], animated: true)
        
        logOutVC.tabBarItem = UITabBarItem(title: "LogAuth", image: Context.image.openDoor, selectedImage: nil)

        
        navigationController?.pushViewController(mainTabBarVC, animated: true)
    }
}



