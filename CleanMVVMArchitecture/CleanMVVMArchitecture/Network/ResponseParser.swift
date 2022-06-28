//
//  ResponseParser.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation

protocol ResponseParserProtocol {
    func parseResponse<T: Codable>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void)
}

class ResponseParser:ResponseParserProtocol {
    
    func parseResponse<T>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void) where T : Decodable, T : Encodable {
        
        let jsonResponse = try? JSONDecoder().decode(type.self, from: data)
        if let jsonResponse = jsonResponse {
            return completion(.success(jsonResponse))
        } else {
            completion(.failure(.UnableToParse))
        }
    }
}
