//
//  Network.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

protocol APIService {
    func execute<T:Codable>(responseType: T.Type, url: URL, completion: @escaping ((Result<T, Error>) -> Void))
}

enum APIError:Error {
    case InValidResponse
    case UnableToParse
}

// TODO: Voilating -  Single Responsibility Principle (Doing Network Call & Parsing)
class Service: APIService {
    
    func execute<T:Codable>(responseType: T.Type, url: URL, completion: @escaping ((Result<T, Error>) -> Void)) {
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            
            guard let data = data, error != nil else {
                completion(.failure(APIError.InValidResponse))
                return
            }
            
            //Paring Response
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch _ {
                completion(.failure(APIError.UnableToParse))
            }
        }
        task.resume()
    }
}

