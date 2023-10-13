//
//  InfoCellViewModelType.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation


protocol InfoCellViewModelType: InfoType {
    
    var species: String {get}
    
    var type: String {get}
    var gender: String {get}
    
}
