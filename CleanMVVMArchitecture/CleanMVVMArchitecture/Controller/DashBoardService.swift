//
//  DashBoardService.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation


protocol DashBoardServiceProtocol {
    func getPostListing(completionHandler: @escaping (Result<[Post],APIError>)-> Void)
}

class DashBoardService:DashBoardServiceProtocol {
    
    func getPostListing(completionHandler: @escaping (Result<[Post],APIError>)-> Void) {
        guard let url = URL(string: EndPoint.dashBoard) else {
            return completionHandler(.failure(.InValidUrl))
        }
        
        var urlRequest =  URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        APIService().execute(responseType: [Post].self, urlRequest: urlRequest,completion: completionHandler)
    }
}
