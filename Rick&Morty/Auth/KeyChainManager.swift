//
//  KeyChainManager.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 08.10.23.
//

import Foundation


enum KeychainError: Error {
    case duplicateItem
    case unknown(status: OSStatus)
}

class KeychainManager {
    
    static func save(password: Data, login: String) throws -> Bool {
        let query : [CFString: Any] = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount : login,
            kSecValueData: password
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecDuplicateItem {
            throw KeychainError.duplicateItem
        }else if status == errSecSuccess {
            throw KeychainError.unknown(status: status)
        }
        
        return true
        
    }
}
