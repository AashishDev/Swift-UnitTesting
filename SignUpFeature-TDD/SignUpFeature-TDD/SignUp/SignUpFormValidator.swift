//
//  SignUpFormValidator.swift
//  SignUpFeature-TDD
//
//  Created by Aashish Tyagi on 2/24/22.
//

import Foundation

class SignUpFormValidator {
    
    func isFirstNameValid(firstName:String) -> Bool {
        var returnValue =  true

        if firstName.count < Constant.FirstNameMinLength || firstName.count >  Constant.FirstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isPasswordValid(password:String) -> Bool {
        
        var returnValue =  true

        if password.count < Constant.PasswordMinLength || password.count >  Constant.PasswordMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    
    func doPasswordMatch(password:String,repeatPassword:String) -> Bool {
      /*  var returnValue = false
        
        if password == repeatPassword {
            returnValue = true
        }
        
        return returnValue */
        return password == repeatPassword
    }
    
    
}
