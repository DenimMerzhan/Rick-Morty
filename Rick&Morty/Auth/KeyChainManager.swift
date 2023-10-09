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

final class KeychainManager {
    
    static let shared = KeychainManager()
    
    private init(){}
    
    private func addItem(query: [CFString: Any]) throws {
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            throw KeychainError.init(status: status)
        }else {
            print("Success Safe")
        }
    }
    
    
    private func findItem(query: [CFString: Any]) throws -> [CFString: Any]? {
        var query = query
        query[kSecReturnAttributes] = kCFBooleanTrue
        query[kSecReturnData] = kCFBooleanTrue
        
        var searchResult: AnyObject?
        
        let status = withUnsafeMutablePointer(to: &searchResult) {
            SecItemCopyMatching(query as CFDictionary, $0)
        }
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        } else {
            return searchResult as? [CFString: Any]
        }
    }
    
    private func deleteItem(query: [CFString: Any]) throws {
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            throw KeychainError(status: status)
        }
    }
}


extension KeychainManager {
    
    struct Credintials {
        var login: String
        var password: String
        
        init(login: String, password: String) {
            self.login = login
            self.password = password
        }
    }
    
    func addCredentials(_ credentials: Credintials, withKey key: String) throws {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrLabel] = key
        query[kSecAttrAccount] = credentials.login
        query[kSecValueData] = credentials.password.data(using: .utf8)
        
        do {
            try addItem(query: query)
        }catch {
            throw error
        }
    }
    
    func getCredentials(withKey key: String) -> Credintials? {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrLabel] = key
        
        var result: [CFString: Any]?
        
        do {
            result = try findItem(query: query)
        }catch {
            print("Ошибка поиска пользователя - \(error)")
            return nil
        }
        
        
        if let account = result?[kSecAttrAccount] as? String,let data = result?[kSecValueData] as? Data,let password = String(data: data, encoding: .utf8) {
            return Credintials(login: account, password: password)
        }else {
            return nil
        }
    }
    
    func deleteCredentials(withKey key: String) throws {
        var query: [CFString: Any] = [:]
        query[kSecClass] = kSecClassGenericPassword
        query[kSecAttrLabel] = key
        
        do {
            try deleteItem(query: query)
        } catch {
            throw error
        }
    }
}
