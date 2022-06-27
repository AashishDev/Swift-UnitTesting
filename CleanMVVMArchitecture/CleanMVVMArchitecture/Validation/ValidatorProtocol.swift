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
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


//@2 - Password
protocol PasswordValidator {
    var password:String { get set }
    func isPasswordValid() -> Bool
}

extension PasswordValidator {
    func isPasswordValid() -> Bool {
        if password.count >= Constant.MinimumPasswordLength {
            return true
        }
        else {
            return false
        }
    }
}

//@3 - PhoneNumber
protocol PhoneNumberValidator {
    var phoneNumber:String { get set }
    func isNumberValid() -> Bool
}

extension PhoneNumberValidator {
    func isNumberValid() -> Bool {
        if phoneNumber.count == Constant.PhoneNumberLength {
            return true
        }
        return false
    }
}




