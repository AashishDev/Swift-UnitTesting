//
//  ValidatorProtocol.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

//@1 - Email
protocol EmailValidator {
    var email:String { get set }
    func isEmailValid() -> Bool
}

extension EmailValidator {
    func isEmailValid() -> Bool{
        return true
    }
}


//@2 - Password
protocol PasswordValidator {
    var password:String { get set }
    func isPasswordValid() -> Bool
}

extension PasswordValidator {
    func isPasswordValid() -> Bool {
        return true
    }
}

//@3 - PhoneNumber
protocol PhoneNumberValidator {
    var phoneNumber:String { get set }
    func isNumberValid() -> Bool
}

extension PhoneNumberValidator {
    func isNumberValid() -> Bool {
        return true
    }
}

