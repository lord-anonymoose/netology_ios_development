//
//  SceneDelegate.swift
//  iOSUI_HW_2
//
//  Created by Philipp Lazarev on 12.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    @objc func buttonPressed(_ sender: UIButton) {
        let postViewController = PostViewController(post: posts[sender.tag])
        
        postViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
        postViewController.modalPresentationStyle = .pageSheet // pageSheet
        print("Hello, world!")
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
                                            
        let feedViewController = FeedViewController()
        feedViewController.title = "Feed"
        feedViewController.view.addSubview(FeedView())
        let feedImage = UIImage(systemName: "house.circle")
        
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        let profileImage = UIImage(systemName: "person.circle")
                    
        let window = UIWindow(windowScene: scene)

        let tabBarController = UITabBarController()
                        
        feedViewController.tabBarItem = UITabBarItem(title: nil, image: feedImage, tag: 0)
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: profileImage, tag: 0)
                        
        let controllers = [feedViewController, profileViewController]
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
        tabBarController.selectedIndex = 0
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
                
        self.window = window

    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

