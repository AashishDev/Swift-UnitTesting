//
//  SignUpWebServiceTest.swift
//  SignUpFeature-TDDTests
//
//  Created by Aashish Tyagi on 2/24/22.
//

import XCTest
@testable import SignUpFeature_TDD

class SignUpWebServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignUpWebService_WhenGivenSuccessfullResponse_ShouldReturnTrue() {
        
        //Arrange
        let sut = SignUpWebService(urlString: "https://jsonplaceholder.typicode.com/posts")
        let signUpFormRequestModel =  SignUpFormRequestModel(firstName:"rohan",lastName:"sharma",password: "123456")
        
        let expectation = self.expectation(description: "SignUp WebService Response Expectation")
        
        //Act
        sut.signUp(withForm: signUpFormRequestModel) { (signUpResponseModel, error) in
            
            //Assert
            // "{\"status\":\"ok\"}"
            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}
