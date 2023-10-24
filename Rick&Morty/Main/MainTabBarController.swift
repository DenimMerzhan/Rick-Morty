//
//  MainTabBarController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 13.10.23.
//

import Foundation
import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        self.tabBar.tintColor = .green
        self.tabBar.barTintColor = Context.color.background
        self.view.backgroundColor = Context.color.background
    }
    
}
