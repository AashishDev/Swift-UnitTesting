//
//  LoginUser.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

struct LoginUser:Codable,EmailValidator,PasswordValidator {
    var email: String
    var password: String
}


struct LoginResponse:Codable {
    let statusCode:Int
    let errorMsg:String
}
