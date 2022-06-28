//
//  UIViewController+Extension.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/28/22.
//

import Foundation
import UIKit

extension UIViewController  {
    
    func showAlert(title: String = "Alert", msg: String)  {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
