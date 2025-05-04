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
        
        let users = Persistence.getUser()?.users ?? []
        
        let userExists = users.contains { user in
            user.email == emailComponent.getTextField && user.password == passwordComponent.getTextField
        }
        
        if userExists {
            
            let alertView = AlertView(viewController: self)
            
            alertView.alertController.title = "You are logged!"
            alertView.alertController.message = "iiiiihuuuulll"
  
        } else  {
            

            emailComponent.textFieldColor = .red
            passwordComponent.textFieldColor = .red
            emailComponent.textFieldBorder = 1
            passwordComponent.textFieldBorder = 1
            wrongAccountWarning.isHidden = false
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                
                self.passwordComponent.textFieldBorder = 0
                self.emailComponent.textFieldBorder = 0
                self.passwordComponent.textFieldColor = nil
                self.emailComponent.textFieldColor = nil
                self.wrongAccountWarning.isHidden = true 
                
            }
            
            
            
        }
    }
}
