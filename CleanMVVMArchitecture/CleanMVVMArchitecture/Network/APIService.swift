//
//  Network.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

class APIService {
    let networkService:NetworkServiceProtocol
    let responseParser:ResponseParserProtocol
    
    init(networkService:NetworkServiceProtocol = NetworkService(),
         responseParser:ResponseParserProtocol = ResponseParser()) {
        self.networkService = networkService
        self.responseParser =  responseParser
    }
    
    func execute<T:Codable>(responseType: T.Type, urlRequest: URLRequest, completion: @escaping ((Result<T, APIError>) -> Void)) {
        
        networkService.execute(urlRequest: urlRequest) { result in
            switch result {
            case .success(let data):
                
                //Parse Response here
                self.responseParser.parseResponse(type: responseType.self, data: data) { parsedResult in
                    switch parsedResult {
                    case .success(let responseModel):
                        completion(.success(responseModel))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}





