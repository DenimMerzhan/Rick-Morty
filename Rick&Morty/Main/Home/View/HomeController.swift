//
//  HomeController.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 09.10.23.
//

import Foundation
import UIKit
import Kingfisher

final class HomeController: UICollectionViewController {
    
    var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        self.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        self.collectionView.backgroundColor = K.color.background
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.identifier)
        homeViewModel = HomeViewModel()
        homeViewModel?.fetchCharacters(numberOfCharacters: 20, completion: {
            self.collectionView.reloadData()
        })
        collectionView.register(CharacterHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharacterHeader.identifier)
        collectionView.register(CharacterFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CharacterFooter.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeViewModel?.numberOfSection ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell,
        let homeViewModel = homeViewModel else {return UICollectionViewCell()}
        let characterCellVM = homeViewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = characterCellVM as? CharacterCellViewModel
        cell.avatar.kf.setImage(with: characterCellVM.urlImage) { result in
            switch result {
            case .failure(let error):
                print("Ошибка загрузки фото - \(error.errorCode)")
            case .success(_):
                cell.loadIndicator.isHidden = true
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 20, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if homeViewModel?.isThereActiveDowloadNewCharacter == true {return CGSize(width: view.frame.width, height: 100)}
        return CGSize.zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        perfomSegueToInfoVC(indexPath: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CharacterHeader.identifier, for: indexPath) as! CharacterHeader
            return headerView
        default:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CharacterFooter.identifier, for: indexPath) as! CharacterFooter
            
            return footerView
        }
        
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let postion = scrollView.contentOffset.y
        
        if postion > ( collectionView.contentSize.height - 100 - scrollView.frame.height) {
            
            guard  homeViewModel?.isCharacterOver == false  else { return }
            guard homeViewModel?.isThereActiveDowloadNewCharacter == false else {return}
            
            homeViewModel?.fetchCharacters(numberOfCharacters: 20, completion: { [weak self] in
                self?.collectionView.reloadData()
            })
        }
    }
}

//MARK: - SegueToInfoVC

extension HomeController {
    func perfomSegueToInfoVC(indexPath: IndexPath){
        
        guard let character = homeViewModel?.characters[indexPath.row] else {return}
        let infoViewModel = InfoViewModel(character: character)
        let infoVC = InfoController(infoViewModel: infoViewModel)
        
        self.navigationController?.pushViewController(infoVC, animated: true)
    }
}


