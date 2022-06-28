//
//  LoginFlowTest.swift
//  CleanMVVMArchitectureTests
//
//  Created by Aashish Tyagi on 6/28/22.
//

import XCTest
@testable import CleanMVVMArchitecture

class LoginFlowTest:XCTestCase {
    
    
    //TODO: --
    func testLoginFlowTest_WhenLoginButtonPressed_ShouldMoveToDashBoardScreen() {
       let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        
        let navigation =  UINavigationController()
        let flow = LoginFlow(navigation: navigation)
        flow.start()
        
        let sut = storyBoard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        _ = sut.view
        //sut.loginButton.sendActions(for: .touchUpInside)
        //wait(for: 4)
    }
    
    private func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        
        // We use a buffer here to avoid flakiness with Timer on CI
        waitForExpectations(timeout: duration + 0.5)
    }
    

}
