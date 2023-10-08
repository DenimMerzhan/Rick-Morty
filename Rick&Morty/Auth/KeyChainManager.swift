//
//  KeyChainManager.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import Foundation


enum KeychainError: Error {
    case itemAlreadyExist
    case itemNotFound
    case errorStatus(String?)
    
    
    init(status: OSStatus) {
        switch status {
        case errSecDuplicateItem:
            self = .itemAlreadyExist
        case errSecItemNotFound:
            self = .itemNotFound
        default:
            let message = SecCopyErrorMessageString(status, nil) as? String
            self = .errorStatus(message)
        }
    }
}

class KeychainManager {
    
    static func save(password: Data, login: String) throws  -> Bool {
        let query : [CFString: Any] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount : login,
            kSecValueData: password
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            throw KeychainError.init(status: status)
        }else {
            print("Success Safe")
            return true
        }
        
    }
}
