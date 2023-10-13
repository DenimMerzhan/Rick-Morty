//
//  CharacterFooter.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit


final class CharacterFooter: UICollectionReusableView {
    
    static let identifier = "FooterCharacterView"
    
    let indicator: UIActivityIndicatorView =  {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.tintColor = .white
        indicator.startAnimating()
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(indicator)
    }
    
    private func setupConstraints(){
        indicator.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self)
        }
    }
    
}
