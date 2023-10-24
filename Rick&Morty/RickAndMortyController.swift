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
        let imagaView = UIImageView(image: Context.image.portal)
        imagaView.contentMode = .scaleAspectFit
        return imagaView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Context.color.background
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startConfing()
        setupConstraints()
    }
    
    func startConfing(){
    }
    
    func setupConstraints(){
    }
}
