//
//  DashBoardViewController.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

class DashBoardViewController: UIViewController {
    var logoutHandler:(() -> Void)?
    var viewModel = DashBoardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DashBoard"
        addLogoutButtonOnNavigationBar()
        viewModel.response = postListing
        viewModel.errorHandler = errorHandler
        viewModel.fetchPostListings()
    }
    
    private func addLogoutButtonOnNavigationBar() {
        let button1 = UIBarButtonItem(image: UIImage(systemName: "gear")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    private func postListing(posts:[Post]){
        print("\nResponse -- \n \(posts)")
    }
    
    private func errorHandler(error:APIError){
        print(error.description)
        DispatchQueue.main.async { [weak self] in
            self?.showAlert(msg: error.description)
        }
    }
    
    @objc func logout(){
        //print("Logout Successfully-- Move to Login")
        self.logoutHandler?()
    }
}
