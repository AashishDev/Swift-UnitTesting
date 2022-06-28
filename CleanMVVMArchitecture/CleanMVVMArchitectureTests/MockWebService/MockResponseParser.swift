//
//  MockResponseParser.swift
//  CleanMVVMArchitectureTests
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation
@testable import CleanMVVMArchitecture

class MockResponseParser:ResponseParserProtocol {
    func parseResponse<T>(type: T.Type, data: Data, completion: (Result<T, APIError>) -> Void) where T : Decodable, T : Encodable {
        completion(.failure(.UnableToParse))
    }
}
