//
//  DashBoardViewModel.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import Foundation

class DashBoardViewModel:ObservableObject {
    private var posts:[Post] = []
    private var service:DashBoardServiceProtocol
   
    var errorHandler:((APIError)-> Void)?
    var dataUpdated:(()-> Void)?

    init(service:DashBoardServiceProtocol) {
        self.service = service
        fetchPostListings()
    }
    
    func fetchPostListings()  {
        
        self.service.getPostListing { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts =  posts
                self?.dataUpdated?()
                
            case .failure(let error):
                self?.errorHandler?(error)
            }
        }
    }
}

extension DashBoardViewModel {
    
    func noOfPost() -> Int {
        posts.count
    }
    
    func titleForPost(index:Int) -> String {
        let post = posts[index]
        return post.title + "\n\n" + post.body
    }
}
