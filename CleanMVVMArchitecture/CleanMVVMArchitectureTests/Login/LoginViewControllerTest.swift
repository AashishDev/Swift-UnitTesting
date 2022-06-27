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
    
    func testLoginViewController_WhenLoginButtonPressed_MoveToDashBoardController() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let sut = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        _ = sut.view

        sut.loginButton.sendActions(for: .touchUpInside)
        wait(for: 5)
        let top = sut.navigationController
        //print("Nav: \(top)")

        //let dashBoard =  sut.navigationController?.topViewController as! DashBoardViewController
       // XCTAssertNil(dashBoard, "After Sucessful login, DashBoard Screen should be visible")
    }
    
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        
        // We use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }
    
}
