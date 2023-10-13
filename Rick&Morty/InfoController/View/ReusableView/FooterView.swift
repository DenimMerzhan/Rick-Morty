//
//  FooterView.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit

class EpisodeHeader: UIView {
    
    let label = UILabel().createLabel(with: nil, withTextColor: .white,withFontr: .systemFont(ofSize: 23))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(label)
    }
    
    func setupConstraints(){
        label.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self)
        }
    }
}
