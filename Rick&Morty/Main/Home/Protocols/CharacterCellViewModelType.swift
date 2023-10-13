//
//  d.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation

protocol CharacterCellViewModelType {
    var name: String {get}
    var gender: String {get}
    var status: String {get}
    var urlImage: URL? {get}
}
