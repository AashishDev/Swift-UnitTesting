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
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let service = MainQueueDispatchDecorator(DashBoardService())
        let vm = DashBoardViewModel(service: service)
        
        let vc = sb.instantiateViewController(identifier: "DashBoardViewController") {
            DashBoardViewController(coder: $0,viewModel:vm)
        }
        
        vc.logoutHandler = logoutUser
        navigation.setViewControllers([vc], animated: false)
    }
    
    func logoutUser() {
        let loginFlow = LoginFlow(navigation: navigation)
        loginFlow.start()
    }
}

class MainQueueDispatchDecorator:DashBoardServiceProtocol {
    private let decoratee:DashBoardServiceProtocol
    
    init(_ decoratee:DashBoardServiceProtocol){
        self.decoratee = decoratee
    }
    
    func getPostListing(completionHandler: @escaping (Result<[Post], APIError>) -> Void) {
        decoratee.getPostListing { result in
            guaranteeMainThread {
                completionHandler(result)
            }
        }
    }
}

func guaranteeMainThread(_ work: @escaping ()-> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async {
            DispatchQueue.main.async(execute: work)
        }
    }
}



