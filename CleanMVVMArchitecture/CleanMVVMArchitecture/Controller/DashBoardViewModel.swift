//
//  DashBoardViewModel.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

@MainActor
class DashBoardViewModel:ObservableObject {
    
    private var service:DashBoardServiceProtocol
    var response:(([Post])-> Void)?
    var errorHandler:((APIError)-> Void)?
    
    init(service:DashBoardServiceProtocol = DashBoardService()) {
        self.service = service
    }
    
    func fetchPostListings()  {
        
        self.service.getPostListing { [weak self] result in
            switch result {
            case .success(let posts):
                self?.response?(posts)
                
            case .failure(let error):
                self?.errorHandler?(error)
            }
        }
    }
}
