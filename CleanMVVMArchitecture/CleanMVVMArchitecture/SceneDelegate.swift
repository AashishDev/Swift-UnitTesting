//
//  SceneDelegate.swift
//  CleanMVVMArchitecture
//
//  Created by Aashish Tyagi on 6/27/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    lazy var navigationContoller:UINavigationController =  {
        let navigationController = UINavigationController()
        navigationController.navigationBar.backgroundColor = UIColor.systemMint.withAlphaComponent(0.3)
        navigationController.navigationBar.prefersLargeTitles = true
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController.navigationBar.tintColor = .white
        return navigationController
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        self.window?.rootViewController = navigationContoller
        self.window?.makeKeyAndVisible()
        
        let loginFlow = LoginFlow(navigation: navigationContoller)
        let flow = AppFlow(navigation: navigationContoller, flow:loginFlow)
        flow.start()
    }

}

