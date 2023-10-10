//
//  Collecition.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation

protocol HomeCollectionViewModelType {
    
    var numberOfSection: Int {get}
    func numberOfRowsInSection(section: Int) -> Int
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CharacterCellViewModelType
}
