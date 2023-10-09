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
}

struct Image {
    var portal = UIImage(named: "Portal")
}

struct UserData {
    var key = "UserAccount"
}
