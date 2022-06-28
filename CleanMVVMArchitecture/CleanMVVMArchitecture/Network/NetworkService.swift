//
//  NetworkService.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation

protocol NetworkServiceProtocol {
    func execute(urlRequest: URLRequest,completion: @escaping ((Result<Data, APIError>) -> Void))
}

enum APIError:Error {
    case InValidResponse
    case UnableToParse
}

// TODO: Voilating -  Single Responsibility Principle (Now Fixed)
class NetworkService: NetworkServiceProtocol {
    
    func execute(urlRequest: URLRequest, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            
            guard let data = data, error != nil else {
                completion(.failure(APIError.InValidResponse))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
