//
//  DashBoardViewController.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

class DashBoardViewController: UIViewController {
    var logoutHandler:(() -> Void)?
    private var viewModel:DashBoardViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init?(coder:NSCoder,viewModel:DashBoardViewModel) {
        self.init(coder: coder)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DashBoard"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addLogoutButtonOnNavigationBar()
        
        viewModel.errorHandler = errorHandler
        viewModel.dataUpdated = {
          self.tableView.reloadData()
        }
    }
    
    private func addLogoutButtonOnNavigationBar() {
        let button1 = UIBarButtonItem(image: UIImage(systemName: "gear")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(logout))
        self.navigationItem.rightBarButtonItem  = button1
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

extension DashBoardViewController:UITableViewDataSource,UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfPost()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.titleForPost(index: indexPath.row)
        
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
