//
//  SignUpViewController.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

class SignUpViewController: UIViewController {

    var completion:(() -> Void)?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SignUp"
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.completion?()
    }
}
