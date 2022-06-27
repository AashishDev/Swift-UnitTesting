//
//  AppFlow.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation
import UIKit

protocol Flow {
    func start()
}

class AppFlow:Flow {
    
    var navigation:UINavigationController
    var flow:Flow
    
    init(navigation:UINavigationController, flow:Flow) {
        self.navigation = navigation
        self.flow = flow
    }
    
    func start() {
        flow.start()
    }
}
