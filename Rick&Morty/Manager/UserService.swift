//
//  UserService.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 24.10.23.
//

import Foundation

struct UserService {
    static let shared = UserService()
    let keyChainUserKey = "UserAccount"
    private init(){}
}
