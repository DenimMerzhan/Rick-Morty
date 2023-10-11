//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 09.10.23.
//

import Foundation
import UIKit
import SnapKit

final class CharacterCell: UICollectionViewCell {
    
    static let identifier = "CharacterCell"
    private var descriptionCharacter = ["Gender", "Status"]
    
    weak var viewModel: CharacterCellViewModel? {
        willSet(viewModel) {
            name.text = viewModel?.name
            gender.text = viewModel?.gender
            status.text = viewModel?.status
        }
    }
    
    var avatar: UIImageView = {
        let imageView =  UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "Rick")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var name = createLabel(with: nil, withTextColor: .white)
    lazy var gender = createLabel(with: nil, withTextColor: .white,withAligment: .center)
    lazy var status = createLabel(with: nil, withTextColor: .white,withAligment: .center)
    
    lazy private var leftStackView: UIStackView = {
        let stackView = UIStackView()
        descriptionCharacter.forEach { description in
            let label = createLabel(with: description + ":", withTextColor: .lightGray)
            stackView.addArrangedSubview(label)
        }
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    lazy private var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gender,status])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
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
        self.addSubview(avatar)
        self.addSubview(name)
        self.backgroundColor = K.color.backgroundCell
        self.layer.cornerRadius = 10
    }
    
    private func setupConstraints(){
        avatar.snp.makeConstraints { make in
            make.left.top.right.equalTo(self).inset(UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
            make.height.equalTo(215)
        }
        
        let stackView = UIStackView(arrangedSubviews: [leftStackView,rightStackView])
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        
        name.snp.makeConstraints { make in
            make.top.equalTo(avatar.snp.bottom)
            make.left.right.equalTo(self).inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            make.bottom.equalTo(stackView.snp.top)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(self).inset(UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8))
            make.top.equalTo(name.snp.bottom)
        }
    }
    
}

//MARK: - CreateLabel

extension CharacterCell {
    
    func createLabel(with text: String?, withTextColor color: UIColor, withAligment aligment:  NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = aligment
        label.textColor = color
        label.font = .systemFont(ofSize: 15)
        return label
    }
    
}
