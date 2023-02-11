//
//  SceneDelegate.swift
//  Game
//
//  Created by Anton Zyabkin on 11.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setupRootViewController(windowScene: windowScene)
    }
    
    private func setupRootViewController(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let moduleBuilder = ModuleBuilder()
        window.rootViewController = moduleBuilder.buildStartViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}

