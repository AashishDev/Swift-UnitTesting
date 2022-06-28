//
//  LoginViewModel.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {
    private var service:LoginServiceProtocol
    var authenticated:((LoginResponse)-> Void)?
    var errorHandler:((APIError)-> Void)?
    
    init(service:LoginServiceProtocol = LoginService()) {
        self.service = service
    }
    
    func fetchLoginUser(loginUser:LoginUser)  {
        self.service.authenticateUser(loginRequest: loginUser) { [weak self] result in
            switch result {
            case .success(let loginResponse):
                self?.authenticated?(loginResponse)
                
            case .failure(let error):
                self?.errorHandler?(error)
            }
        }
    }
}

extension LoginViewModel {
    func validate(loginUser:LoginUser) -> Bool {
        if !loginUser.isEmailValid() {
            return false
        }
        
        if !loginUser.isPasswordValid() {
            return false
        }
        return true
    }
}











/* TODO: Binding using completion block
 func fetchLoginUser(loginRequest:LoginUser,completionHandler: @escaping (Result<LoginResponse,APIError>)-> Void)  {
 self.service.authenticateUser(loginRequest: loginRequest, completionHandler: completionHandler)
 }*/
