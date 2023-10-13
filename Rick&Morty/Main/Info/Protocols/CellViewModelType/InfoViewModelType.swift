//
//  InfoViewModelType.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation
import UIKit


protocol InfoViewModelType {
    
    var numberOfSections: Int {get}
    func numberOfRowsInSection(section: Int) -> Int
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> InfoType
}
