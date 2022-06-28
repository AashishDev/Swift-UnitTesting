//
//  MockNetworkService.swift
//  CleanMVVMArchitectureTests
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation
@testable import CleanMVVMArchitecture

class MockNetworkService:NetworkServiceProtocol {
    
    func execute(urlRequest: URLRequest, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        completion(.failure(.InValidResponse))
    }
}
