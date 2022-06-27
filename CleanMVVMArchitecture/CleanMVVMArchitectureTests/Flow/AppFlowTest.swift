//
//  AppFlowTest.swift
//  CleanMVVMArchitectureTests
//
//  Created by Aashish Tyagi on 6/27/22.
//

import XCTest
@testable import CleanMVVMArchitecture

class AppFlowTest: XCTestCase {

    func testAppFlow_WhenAppStart_IntialScreenIsLogin(){
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let sut = storyBoard.instantiateInitialViewController() as? LoginViewController
        XCTAssertNotNil(sut, "Initial Screen should be Login")
    }

}
