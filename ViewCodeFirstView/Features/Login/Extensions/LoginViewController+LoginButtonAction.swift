//
//  LogginButtonConfig.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 01/05/25.
//

import Foundation
import UIKit

extension LoginViewController {
    @objc func handleAccountButtonTap() {
        
        let users = Persistence.getUsers()?.usersList ?? []
        var ExistentUser: User?
        
        let userExists = users.contains { user in
            
            if user.email == emailComponent.getAndSetTextField && user.password == passwordComponent.getAndSetTextField {
                
                ExistentUser = User(name: user.email, date: user.date, email: user.email, password: user.password)
            }
            
            return user.email == emailComponent.getAndSetTextField && user.password == passwordComponent.getAndSetTextField
            
        }
        
        if userExists {
            
            //MARK: SAVING THE LOGGED USER
            do {
                
                let encoder = JSONEncoder()
                let userEncoded =  try encoder.encode(ExistentUser)
                UserDefaults.standard.set(userEncoded, forKey: keyUserLogged)
                
            } catch {
                
                print(error.localizedDescription)
                
            }
            
            //MARK: TRANSITION TO TabBarViewController
            let TabBarViewController = TabBarViewController()
            
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(TabBarViewController)
            
        } else  {
            

            emailComponent.textFieldBorderColor = .red
            passwordComponent.textFieldBorderColor = .red
            emailComponent.textFieldBorder = 1
            passwordComponent.textFieldBorder = 1
            wrongAccountWarning.isHidden = false
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                
                self.passwordComponent.textFieldBorder = 0
                self.emailComponent.textFieldBorder = 0
                self.passwordComponent.textFieldBorderColor = nil
                self.emailComponent.textFieldBorderColor = nil
                self.wrongAccountWarning.isHidden = true 
                
            }
        }
    }
}
