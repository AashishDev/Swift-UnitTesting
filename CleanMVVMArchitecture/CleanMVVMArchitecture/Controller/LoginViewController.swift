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
    
   lazy private var viewModel =  LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.completion?(.Authenicated)

        //validateAndSendLoginDetailsToServer()
    }
 
    //MARK: UIButton Actions
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.completion?(.SignUp)
    }
}


extension LoginViewController {
    
    private func validateAndSendLoginDetailsToServer(){
        let loginUser = LoginUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        viewModel.fetchLoginUser(loginUser: loginUser)
    }
    
    private func authenticatedUser(loginResponse:LoginResponse){
        //TODO: Save Login Details, So can use throught your application.
        self.completion?(.Authenicated)
    }
    
    private func errorHandler(error:APIError){
        //FIXME: Need to convert error message in user understandable form
        print(error.description)
        showAlert(msg: error.description)
    }
}
