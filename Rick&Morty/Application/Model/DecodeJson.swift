//
//  DecodeJson.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation

struct DecodeJson {
    
    static func decode<T: Decodable>(with data: Data, type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let decodeData = try jsonDecoder.decode(T.self, from: data)
            return decodeData
        }catch {
            print("Ошибка декодирования данного типа - \(T.self) - \(error) ")
            return nil
        }
    }
    
}
