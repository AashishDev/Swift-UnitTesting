//
//  NetworkConfig.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation

enum HTTPMethod:String {
    case GET
    case POST
    case UPDATE
}

enum APIError:Error {
    case InValidUrl
    case InValidResponse
    case UnableToParse
    
    var description:String  {
        switch self {
        case .InValidUrl:
            return "InValid API Url"
        case .InValidResponse:
            return "InValid API Response"
        case .UnableToParse:
            return "Unable to Parse"
        }
    }
}
