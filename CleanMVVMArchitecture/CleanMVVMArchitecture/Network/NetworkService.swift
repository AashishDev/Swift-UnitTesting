//
//  NetworkService.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation
import CoreVideo

protocol NetworkServiceProtocol {
    func execute(urlRequest: URLRequest,completion: @escaping ((Result<Data, APIError>) -> Void))
}

// TODO: Voilating -  Single Responsibility Principle (Now Fixed)
class NetworkService: NetworkServiceProtocol {
    
    func execute(urlRequest: URLRequest, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            
            guard error == nil else {
                print("Error-- \(String(describing: error?.localizedDescription))")
               completion(.failure(APIError.InValidResponse))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
