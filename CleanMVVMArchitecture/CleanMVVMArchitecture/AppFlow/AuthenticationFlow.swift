//
//  AuthenticationFlow.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation
import UIKit

class LoginFlow:Flow {
    var navigation:UINavigationController
    
    init(navigation:UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.completion = loginSucessfull
        navigation.setViewControllers([vc], animated: false)
    }
    
    func loginSucessfull(loginScreenAction:LoginScreenAction) {
        print("Login Successfull - ")
        
        switch loginScreenAction {
        case .Authenicated:
            let dashBoardFlow = DashBoardFlow(navigation: navigation)
            dashBoardFlow.start()
            
        case .SignUp:
            let signUpFlow = SignUpFlow(navigation: navigation)
            signUpFlow.start()
        }
    }
}



class SignUpFlow:Flow {
    var navigation:UINavigationController
    
    init(navigation:UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        vc.completion = signUpSucessfull
        navigation.pushViewController(vc, animated: true)
    }
    
    func signUpSucessfull() {
        print("SignUp Successfull - Back to Login Screen ")
        navigation.popViewController(animated: false)
    }
}
