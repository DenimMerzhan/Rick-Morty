//
//  NetworkManager.swift
//  Rick&Morty
//
//  Created by Деним Мержан on 10.10.23.
//

import Foundation

enum NetworkError: Error {
    case noData
    case networkError(String)
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init(){
        
    }
    
    func fetchCharacter(with url: URL, completion: @escaping (Result<Data,NetworkError>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Ошибка получения персоонажа - \(error)")
                sendFailure(with: .networkError(error.localizedDescription))
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("response status code - \(response.statusCode)")
                }
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }else {
                sendFailure(with: .noData)
            }
            
            func sendFailure(with error: NetworkError) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
        
    }
}
