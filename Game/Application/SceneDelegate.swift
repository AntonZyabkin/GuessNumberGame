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
        let factory = Factory()
        let game = GameController()
        let moduleBuilder = ModuleBuilder(factory: factory, game: game)
        let navigationController = UINavigationController(rootViewController: moduleBuilder.buildStartViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

