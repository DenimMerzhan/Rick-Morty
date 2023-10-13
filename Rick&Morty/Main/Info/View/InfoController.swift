//
//  EpisodeController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit

class InfoController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var infoViewModel: InfoViewModel
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    init(infoViewModel: InfoViewModel){
        self.infoViewModel = infoViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startConfing()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func startConfing(){
        self.view.backgroundColor = K.color.background
        self.tableView.backgroundColor = K.color.background
        self.view.addSubview(tableView)
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(PlanetCell.self, forCellReuseIdentifier: PlanetCell.identifier)
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.identifier)
        
        infoViewModel.fetchAllEpisodes { [weak self] in
            self?.tableView.reloadData()
        }
        
        infoViewModel.fetchLocation { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func setupConstraints(){
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(self.view).inset(UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
            make.top.bottom.equalTo(self.view)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return infoViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let infoCell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier, for: indexPath) as? InfoCell {
                let viewModel = infoViewModel.cellViewModel(forIndexPath: indexPath)
                infoCell.viewModel = viewModel as? InfoCellViewModel
                return infoCell
            }
        case 1:
            if let planetCell = tableView.dequeueReusableCell(withIdentifier: PlanetCell.identifier, for: indexPath) as? PlanetCell {
                let viewModel = infoViewModel.cellViewModel(forIndexPath: indexPath)
                planetCell.viewModel = viewModel as? PlanetCellViewModel
                return planetCell
            }
        default:
            if let episodeCell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.identifier, for: indexPath) as? EpisodeCell {
                let viewModel = infoViewModel.cellViewModel(forIndexPath: indexPath) as? EpisodeCellViewModel
                episodeCell.viewModel = viewModel
                return episodeCell
            }
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let avatarHeader = AvatarHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 250), name: infoViewModel.character.name, status: infoViewModel.character.status)
            avatarHeader.avatar.kf.setImage(with: infoViewModel.character.image)
            return avatarHeader
        default:
            let episodeHeader = EpisodeHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
            episodeHeader.label.text = infoViewModel.textFooter(textForFooterInSection: section)
            return episodeHeader
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 250
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
