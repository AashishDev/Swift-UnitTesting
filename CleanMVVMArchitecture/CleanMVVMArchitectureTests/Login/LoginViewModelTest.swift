//
//  LoginViewModelTest.swift
//  CleanMVVMArchitectureTests
//
//  Created by Aashish Tyagi on 6/27/22.
//

import XCTest
@testable import CleanMVVMArchitecture

class LoginViewModelTest: XCTestCase {
    var sut:LoginViewModel!
    
    override  func setUp() {
        sut = LoginViewModel()
    }
    
    override func tearDown() {
        sut =  nil
    }

    func testLoginViewModel_ForInValidEmail_ValidationShouldFalse() {

        let loginUser = LoginUser(email: "test@gmailcom", password: "123456")
        let validationResult = sut.validate(loginUser: loginUser)
        XCTAssertFalse(validationResult, "For Invalid email id, validation should return as false")
    }
    
    func testLoginViewModel_WhenPasswordIsLessThen6Digit_ValidationShouldFalse() {
        let loginUser = LoginUser(email: "test@gmail.com", password: "1546")
        let validationResult = sut.validate(loginUser: loginUser)
        XCTAssertFalse(validationResult, "For Short Password or less then 6 digit, validation should return as false")
    }
    
    func testLoginViewModel_WhenEmailAndPasswordAreValid_ValidationShouldTrue() {
        
        let loginUser = LoginUser(email: "test@gmail.com", password: "153546")
        let validationResult = sut.validate(loginUser: loginUser)
        XCTAssertTrue(validationResult, "For Valid Email and Password, validation should return as True")
    }
    
    

}
