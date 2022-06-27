//
//  DashBoardFlow.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation
import UIKit


class DashBoardFlow:Flow {
    var navigation:UINavigationController
    
    init(navigation:UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc =  storyBoard.instantiateViewController(withIdentifier: "DashBoardViewController") as! DashBoardViewController
        vc.logoutHandler = logoutUser
        navigation.setViewControllers([vc], animated: false)
    }
    
    func logoutUser() {
        let loginFlow = LoginFlow(navigation: navigation)
        loginFlow.start()
    }
}
