//
//  SignUpFormRequestModel.swift
//  SignUpFeature-TDD
//
//  Created by Aashish Tyagi on 2/24/22.
//

import Foundation

struct SignUpFormRequestModel: Encodable {
    var firstName:String
    var lastName:String
    var password: String
}
