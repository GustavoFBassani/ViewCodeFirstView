//
//  Profile+DeleteAccountButton.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//
import Foundation
import UIKit

extension ProfileViewController {
    
    @objc func deleteAccount() {
        
        do {
            
            if let userToDelete = UserDefaults.standard.data(forKey: keyUserLogged) {
                
                let decoder = JSONDecoder()
                let decodedUser = try decoder.decode(User.self, from: userToDelete)
                
                Persistence.removeUserAndSaveList(userToRemove: decodedUser)
                
            }
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
        UserDefaults.standard.removeObject(forKey: keyUserLogged)
        
        
        //MARK: TRANSITION TO LoginViewController
        let navController = UINavigationController(rootViewController: LoginViewController())
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(navController)
        
    }
}
