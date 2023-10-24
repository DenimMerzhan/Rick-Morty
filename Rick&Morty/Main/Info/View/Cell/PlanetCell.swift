//
//  PlanetCell.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit

class PlanetCell: UITableViewCell {
    
    static let identifier = "planetCell"
    
    let image: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let name = UILabel().createLabel(with: "unknow", withTextColor: .white)
    let type = UILabel().createLabel(with: "unknow", withTextColor: .green)
    
    weak var viewModel: PlanetCellViewModel? {
        didSet {
            name.text = viewModel?.name ?? "unknow"
            image.image = viewModel?.image
            type.text = viewModel?.type ?? "unknow"
        }
    }
    
    
    private let planetView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [planetView,descriptionStackView])
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    lazy var descriptionStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [name,type])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
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
        self.addSubview(stackView)
        self.backgroundColor = Context.color.backgroundCell
        self.layer.cornerRadius = 15
        planetView.layer.cornerRadius = 10
        planetView.backgroundColor = Context.color.planet
        planetView.addSubview(image)
    }
    
    func setupConstraints(){
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        planetView.snp.makeConstraints { make in
            make.height.width.equalTo(60)
        }
        
        image.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(planetView)
            make.width.height.equalTo(20)
        }
    }
    
    
}
