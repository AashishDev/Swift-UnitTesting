//
//  LoginService.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation

protocol LoginServiceProtocol {
    func authenticateUser(loginRequest:LoginUser,completionHandler: @escaping (Result<LoginResponse,APIError>)-> Void)
}

class LoginService:LoginServiceProtocol {

    func authenticateUser(loginRequest:LoginUser,completionHandler: @escaping (Result<LoginResponse,APIError>)-> Void) {
        guard let url = URL(string: EndPoint.login) else {
            return completionHandler(.failure(.InValidUrl))
        }
        
        var urlRequest =  URLRequest(url: url)
        let postBody = try? JSONEncoder().encode(loginRequest)
        urlRequest.httpBody = postBody
        urlRequest.httpMethod = HTTPMethod.POST.rawValue
        APIService().execute(responseType: LoginResponse.self, urlRequest: urlRequest,completion: completionHandler)
    }
}
