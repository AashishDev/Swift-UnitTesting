//
//  SignUpWebService.swift
//  SignUpFeature-TDD
//
//  Created by Aashish Tyagi on 2/24/22.
//

import Foundation

enum SignUpError {
   case failedResponse
   case decodingFailed
}

class SignUpWebService {
    
    private var urlString:String
    private var urlSession:URLSession
    
    init(urlString:String, urlSession:URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp(withForm formModel:SignUpFormRequestModel, completionHandler:@escaping (SignUpFormResponseModel?, SignUpError?) -> Void) {
        
        guard let url = URL(string: self.urlString) else {
            //TODO: Need a unit test case here
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        urlRequest.httpBody =  try? JSONEncoder().encode(formModel.self)
        
        
        let dataTask =  self.urlSession.dataTask(with: urlRequest) { data,response, error in
            
            if  let data = data,let response = try? JSONDecoder().decode(SignUpFormResponseModel.self, from: data)  {
                completionHandler(response,nil)
            }
            else {
                //TODO: Need Unit Case here to handle error
                completionHandler(nil,nil)
            }
        }
        dataTask.resume()
        
    }
}
