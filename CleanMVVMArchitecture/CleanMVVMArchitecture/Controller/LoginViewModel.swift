//
//  LoginViewModel.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {
    
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
