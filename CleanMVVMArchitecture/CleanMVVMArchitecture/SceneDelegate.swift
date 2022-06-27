//
//  SceneDelegate.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        windowScene.keyWindow?.makeKeyAndVisible()
        let navigationController = UINavigationController()
        windowScene.keyWindow?.rootViewController = navigationController
        
        let loginFlow = LoginFlow(navigation: navigationController)
        let flow = AppFlow(navigation: navigationController, flow:loginFlow)
        flow.start()
    }


}

