//
//  DashBoardViewController.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

class DashBoardViewController: UIViewController {
    var logoutHandler:(() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DashBoard"
        addLogoutButtonOnNavigationBar()
    }
    
    private func addLogoutButtonOnNavigationBar() {
        let button1 = UIBarButtonItem(image: UIImage(systemName: "gear")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    @objc func logout(){
        print("Logout Successfully-- Move to Login")
        self.logoutHandler?()
    }
}
