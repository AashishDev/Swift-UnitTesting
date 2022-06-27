//
//  LoginViewController.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

enum LoginScreenAction:String {
  case Authenicated
  case SignUp
}

class LoginViewController: UIViewController {
    var completion:((LoginScreenAction) -> Void)?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.completion?(.Authenicated)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.completion?(.SignUp)
    }
}
