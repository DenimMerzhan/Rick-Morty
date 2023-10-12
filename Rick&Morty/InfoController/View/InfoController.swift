//
//  EpisodeController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit

class InfoController: UITableViewController {
    
    var infoViewModel: InfoViewModel
    
    init(infoViewModel: InfoViewModel) {
        self.infoViewModel = infoViewModel
        super.init(style: .grouped)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startConfing()
    }
    
    func startConfing(){
        self.view.backgroundColor = K.color.background
        self.tableView.backgroundColor = .red
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(PlanetCell.self, forCellReuseIdentifier: PlanetCell.identifier)
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.identifier)
//        tableView.contentInset = .init(top: 0, left: 15, bottom: 0, right: -30)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return infoViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoViewModel.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            if let episodeCell = tableView.dequeueReusableCell(withIdentifier: PlanetCell.identifier, for: indexPath) as? EpisodeCell {
                return episodeCell
            }
        }
        
        return UITableViewCell()
    }
    
}
