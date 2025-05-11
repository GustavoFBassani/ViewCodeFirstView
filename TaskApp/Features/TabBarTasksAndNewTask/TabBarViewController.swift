//
//  Untitled.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    lazy var profileTabBar: UINavigationController = {
        
        let title = "Profile"
        let image = UIImage(systemName: "person.fill")
        let tabItem = UITabBarItem(title: title, image: image, selectedImage: image)
       
        let rootViewController = ProfileViewController()
        rootViewController.tabBarItem = tabItem
        
        let navController = UINavigationController(rootViewController: rootViewController)
        
        return navController
        
    }()
    
    lazy var TaskTabBar: UINavigationController = {
        
        let title = "Tasks"
        let image = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        let tabItem = UITabBarItem(title: title, image: image, selectedImage: image)

        let rootViewController = TaskViewController()
        rootViewController.tabBarItem = tabItem
    
        let navController = UINavigationController(rootViewController: rootViewController)
        
        return navController
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [TaskTabBar,profileTabBar]
        
    }
}
