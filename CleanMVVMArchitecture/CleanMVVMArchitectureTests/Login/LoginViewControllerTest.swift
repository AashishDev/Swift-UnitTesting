//
//  LoginViewControllerTest.swift
//  CleanMVVMArchitectureTests
//
//  Created by Aashish Tyagi on 6/27/22.
//

import XCTest
@testable import CleanMVVMArchitecture

class LoginViewControllerTest: XCTestCase {

    override  func setUp() {
    }
    
    override func tearDown() {
    }
    
    func testLoginViewController_PasswordField_ShouldBeSecureField() {
     
       let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let sut = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        _ = sut.view
        
        let isSecureField =  sut.passwordTextField.isSecureTextEntry
        XCTAssertTrue(isSecureField)
    }
    
}
