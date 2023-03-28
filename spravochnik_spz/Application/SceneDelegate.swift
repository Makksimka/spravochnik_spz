//
//  SceneDelegate.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 19.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupRootViewController(windowScene: windowScene)
    }
}



// MARK: - Private methods
private extension SceneDelegate {
    func setupRootViewController(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let sceneBuildManager: Buildable = SceneBuildManager()
//        let model = NoСoefficientModel(title: "", leftButton: "", rightButton: "")
        let model = ChoiceCoefficientModel(type: .terrain, itemIndex: 3)
        
        let viewController = sceneBuildManager.buildAlertScreen(coefficientType: .choice(model: .init(type: .terrain, itemIndex: 5)))
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
        self.window = window
    }
}

