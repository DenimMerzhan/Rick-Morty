//
//  Model.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation


struct Character: Decodable {
    
    var id:Int
    var name: String
    var status: String
    
    var species: String
    var type: String
    var gender: String
    
    var location: characterLocation
    
    var image: URL?
    var episode: [String]
    
}

struct characterLocation: Decodable {
    var name: String
    var url: String?
}
