//
//  InfoCell.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit


final class InfoCell: UITableViewCell {
    
    static let identifier = "InfoCell"
    
    let species = UILabel().createLabel(with: nil, withTextColor: .white,withAligment: .left)
    let type = UILabel().createLabel(with: nil, withTextColor: .white,withAligment: .left)
    let gender = UILabel().createLabel(with: nil, withTextColor: .white,withAligment: .left)
    
    weak var viewModel: InfoCellViewModel? {
        didSet {
            species.text = viewModel?.species
            type.text = viewModel?.type
            gender.text = viewModel?.gender
        }
    }
    
    private var descriptionCharacter = ["Species", "Type", "Gender"]
    
    private lazy var leftStackView: UIStackView =  {
       let stackView = UIStackView()
        descriptionCharacter.forEach { description in
            let label = UILabel().createLabel(with: description + ":", withTextColor: .lightGray,withAligment: .left)
            stackView.addArrangedSubview(label)
        }
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        return stackView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [species,type,gender])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        return stackView
    }()
    
    private lazy var mostStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [leftStackView,rightStackView])
        stackView.spacing = 69
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        self.backgroundColor = K.color.backgroundCell
        self.layer.cornerRadius = 15
        self.addSubview(mostStackView)
    }
    
    func setupConstraints(){
        mostStackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
    
    
    
}
