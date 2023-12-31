//
//  K.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import Foundation
import UIKit

struct K {
    
    static let color = Color()
    static let image = Image()
    static let userData = UserData()
    
    
}

struct Color {
    var background = UIColor(named: "BackgroundApp")
    var backgroundCell = UIColor(named: "BackgroundCell")
    var green = UIColor(named: "Green")
    var planet = UIColor(named: "PlanetColor")
}

struct Image {
    var planet = UIImage(named: "Planet")
    var portal = UIImage(named: "Portal")
    var openDoor = UIImage(named: "OpenDoor")
}

struct UserData {
    var key = "UserAccount"
}
