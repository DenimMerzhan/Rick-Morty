//
//  AvatarHeaderView.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 13.10.23.
//

import Foundation
import UIKit


final class AvatarHeaderView: UIView {
 
    let avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(160)
        }
        return imageView
    }()
    
    private var name = UILabel().createLabel(with: nil, withTextColor: .white,withAligment: .center)
    private var status = UILabel().createLabel(with: nil, withTextColor: .green,withAligment: .center)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avatar,name,status])
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.alignment = .center
        return stackView
    }()
    
     init(frame: CGRect,name: String, status: String) {
        super.init(frame: frame)
        self.name.text = name
        self.status.text = status
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.addSubview(stackView)
        self.backgroundColor = Context.color.background
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0))
        }
    }
    
}
