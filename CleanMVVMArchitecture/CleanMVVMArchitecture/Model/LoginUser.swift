//
//  LoginUser.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

struct LoginUser:EmailValidator,PasswordValidator {
    var email: String
    var password: String
}
