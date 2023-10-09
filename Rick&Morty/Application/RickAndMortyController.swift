//
//  Rick&MortyController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 09.10.23.
//

import Foundation
import UIKit

class RickAndMortyController: UIViewController {
    
    var portalImage: UIImageView = {
        let imagaView = UIImageView(image: K.image.portal)
        imagaView.contentMode = .scaleAspectFit
        return imagaView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = K.color.background
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupConstraints()
    }
    
    
    
    func setupConstraints(){
        
    }
}
