//
//  Profile+SignOutButton.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//
import Foundation
import UIKit

extension ProfileViewController {
    
    @objc func signOut() {
        
        UserDefaults.standard.removeObject(forKey: keyUserLogged)
        
        //MARK: TRANSITION TO LoginViewController
        let loginViewController = LoginViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginViewController)
    
    }
    
}
