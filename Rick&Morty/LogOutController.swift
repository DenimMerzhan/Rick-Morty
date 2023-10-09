//
//  MainController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import Foundation
import UIKit
import SnapKit

class LogOutController: UIViewController {
    
    private var portalImage: UIImageView = {
        let imagaView = UIImageView(image: K.image.portal)
        imagaView.contentMode = .scaleAspectFit
        return imagaView
    }()
    
    private lazy var logOutButton: UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(logOutPressed), for: .touchUpInside)
        button.setTitle("Выйти из аккаунта", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = K.color.background
        self.view.addSubview(portalImage)
        self.view.addSubview(logOutButton)
    }
    
    func setupConstrains(){
        portalImage.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self.view)
            make.height.width.equalTo(self.view.frame.width / 2)
        }
        
        logOutButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(20)
            make.centerX.equalTo(self.view)
        }
    }
    
    @objc func logOutPressed(){
        
    }
    
}
