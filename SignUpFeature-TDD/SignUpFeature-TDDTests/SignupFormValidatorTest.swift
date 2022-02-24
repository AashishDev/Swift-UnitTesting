//
//  SignupFormValidatorTest.swift
//  SignUpFeature-TDDTests
//
//  Created by Aashish Tyagi on 2/24/22.
//

import XCTest
@testable import SignUpFeature_TDD

class SignupFormValidatorTest: XCTestCase {
    
    var sut: SignUpFormValidator!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignUpFormValidator()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_SignUpValidator_withValidFirstName_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"Rohan")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "isFirstNameValid() should return TRUE for valid first name but return false")
    }
    
    func test_SignUpValidator_whenTooShortFirstName_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "a")
        
        //Assert
        XCTAssertFalse(isFirstNameValid,"isFirstNameValid() for short name which have less then \(Constant.FirstNameMinLength) characters should return FALSE but it return TRUE")
    }
    
    func test_SignUpValidator_whenTooLongFirstName_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "rohanrohanrohan")
        
        //Assert
        XCTAssertFalse(isFirstNameValid,"isFirstNameValid() for long name which have greater then \(Constant.FirstNameMaxLength) characters should return FALSE but it return TRUE")
    }
    
    
    func test_SignUpValidator_withValidPassword_ShouldReturnTrue() {
        
        //Arrange
        //Act
        let isFirstNameValid = sut.isPasswordValid(password:"123456")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "isPasswordValid() should return TRUE for valid first name but return false")
    }
    
    func test_SignUpValidator_whenTooShortPassword_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "a")
        
        //Assert
        XCTAssertFalse(isPasswordValid,"isPasswordValid() for short name which have less then \(Constant.PasswordMinLength) characters should return FALSE but it return TRUE")
    }
    
    func test_SignUpValidator_whenTooLongPassword_ShouldReturnFalse() {
        
        //Arrange
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "rohanrohanrohan")
        
        //Assert
        XCTAssertFalse(isPasswordValid,"isPasswordValid() for long name which have greater then \(Constant.PasswordMaxLength) characters should return FALSE but it return TRUE")
    }
    
    
    func test_SignUpValidator_whenSamePasswordProvided_ShouldReturnTrue(){
        
        //Arrange
        //Act
        let isValidPassword =  sut.doPasswordMatch(password: "123456", repeatPassword:"123456")
        
        //Assert
        XCTAssertTrue(isValidPassword, "doPasswordMatch() should return TRUE when repeat password same as password")
    }
    
    
}
