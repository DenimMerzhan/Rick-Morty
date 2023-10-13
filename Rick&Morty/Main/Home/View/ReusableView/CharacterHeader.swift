//
//  CharacterHeader.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit
import SnapKit

final class CharacterHeader: UICollectionReusableView {
    
    static let identifier = "CharacterHeader"
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "Characters"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    private func setupView(){
        self.addSubview(label)
    }
    
    private func setupConstraints(){
        label.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self).inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
