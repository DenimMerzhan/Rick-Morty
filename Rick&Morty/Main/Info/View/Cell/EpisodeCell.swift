//
//  EpisodeCell.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 12.10.23.
//

import Foundation
import UIKit


final class EpisodeCell: UITableViewCell {
    
    static let identifier = "EpisodeCell"
    
    var name = UILabel().createLabel(with: nil, withTextColor: .white,withFontr: .systemFont(ofSize: 17))
    var episode = UILabel().createLabel(with: nil, withTextColor: .green,withFontr: .systemFont(ofSize: 13))
    var airDate = UILabel().createLabel(with: nil, withTextColor: .lightGray, withFontr: .systemFont(ofSize: 13))
    
    weak var viewModel: EpisodeCellViewModel? {
        didSet {
            name.text = viewModel?.name
            episode.text = createEpisodeSeasonString(episode: viewModel?.episode, season: viewModel?.season)
            airDate.text = viewModel?.airDate
        }
    }
    
    private lazy var backView: UIView  = {
       let view = UIView()
        view.backgroundColor = K.color.backgroundCell
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var descriptionStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [name,episode])
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [descriptionStackView,airDate])
        stackView.distribution = .fillProportionally
        stackView.alignment = .bottom
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
        self.addSubview(backView)
        self.backgroundColor = K.color.background
        backView.addSubview(stackView)
    }
    
    func setupConstraints(){
        
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        airDate.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
    }
    
    
}

//MARK: - CreateEpisodeSeasonString

extension EpisodeCell {
    func createEpisodeSeasonString(episode: String?, season: String?) -> String {
        guard let episode = episode, let season = season else {return ""}
        let text = "Episode: \(episode) ,Season: \(season)"
        return text
    }
}
