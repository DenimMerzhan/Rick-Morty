//
//  InfoCellViewModelType.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 11.10.23.
//

import Foundation


protocol EpisodeCellViewModelType: InfoType {
    
    var name: String? {get}
    var episode: String? {get}
    
    var season: String? {get}
    var releaseDate: String? {get}
    
}
