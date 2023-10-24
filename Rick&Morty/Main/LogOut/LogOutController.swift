//
//  MainController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class LogOutController: RickAndMortyController {
    
    private lazy var logOutButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(logOutPressed), for: .touchUpInside)
        button.setTitle("Выйти из аккаунта", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startConfing()
    }
    
    override func startConfing(){
        self.view.addSubview(portalImage)
        self.view.addSubview(logOutButton)
    }
    
    
    override func setupConstraints() {
        portalImage.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.view)
            make.height.width.equalTo(self.view.frame.width / 2)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-40)
            make.centerX.equalTo(self.view)
        }
    }
    
    @objc func logOutPressed(){
        let alert = createAlert()
        self.present(alert, animated: true)
    }
    
}

//MARK: - CreateAlert

extension LogOutController {
    func createAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Выход", message: "При выходе из аккаунта данные удалятся и прийдется регистрироваться заново", preferredStyle: .alert)
        let deletAccountAction = UIAlertAction(title: "Ок", style: .default) { [weak self] action in
            self?.deleteUser()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        alert.addAction(deletAccountAction)
        alert.addAction(cancelAction)
        return alert
    }
}

//MARK: - deleteUser

extension LogOutController {
    func deleteUser(){
        do {
            try KeychainManager.shared.deleteCredentials(withKey: UserService.shared.keyChainUserKey)
            KingfisherManager.shared.cache.clearMemoryCache()
            peromSegueToAuthVC()
        }catch{
            let alert = createErrorAlert(errorMessage: "\(error)")
            self.present(alert, animated: true)
        }
    }
}

//MARK: - PeromSegueToAuthVC

extension LogOutController {
    func peromSegueToAuthVC(){
        let authController = AuthController()
        navigationController?.setViewControllers([authController], animated: true)
    }
}
