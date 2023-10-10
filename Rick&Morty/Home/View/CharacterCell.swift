//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 09.10.23.
//

import Foundation
import UIKit
import SnapKit

class CharacterCell: UICollectionViewCell {
    
    static let identifier = "CharacterCell"
    private var descriptionCharacter = ["Name", "Gender", "Status"]
    
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
    
    lazy var name = createLabel(with: nil, with: .white)
    lazy var gender = createLabel(with: nil, with: .white)
    lazy var status = createLabel(with: nil, with: .white)
    
    lazy private var leftStackView: UIStackView = {
        let stackView = UIStackView()
        descriptionCharacter.forEach { description in
            let label = createLabel(with: description + ":", with: .lightGray)
            stackView.addArrangedSubview(label)
        }
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy private var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name,gender,status])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(avatar)
        self.backgroundColor = K.color.backgroundCell
        self.layer.cornerRadius = 10
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        avatar.snp.makeConstraints { make in
            make.left.top.right.equalTo(self).inset(UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
            make.height.equalTo(215)

        }
        let stackView = UIStackView(arrangedSubviews: [leftStackView,rightStackView])
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(self).inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            make.top.equalTo(avatar.snp.bottom)
        }
    }
    
}

//MARK: - CreateLabel

extension CharacterCell {
    
    func createLabel(with text: String?, with color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        return label
    }
    
}