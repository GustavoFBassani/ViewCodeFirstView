//
//  buttonConfig.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 01/05/25.
//

import Foundation
import UIKit

extension CreateAccountViewController {
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let password = textField.text else { return }
        
        //MARK: PASSWORD VERIFICATION
        if password.count >= 8 {
            
            lessCharComponent.image = UIImage(systemName: "checkmark")
            lessCharComponent.imageColor = .green
            
        } else {
            
            lessCharComponent.image = UIImage(systemName: "xmark")
            lessCharComponent.imageColor = .red

        }
        
        if password.contains(where: { $0.isNumber }) {
            
            oneNumberComponent.image = UIImage(systemName: "checkmark")
            oneNumberComponent.imageColor = .green
            
        } else {
            
            oneNumberComponent.image = UIImage(systemName: "xmark")
            oneNumberComponent.imageColor = .red

        }
        
        if password.contains(where: { $0.isUppercase }) {
            
            upperCaseComponent.image = UIImage(systemName: "checkmark")
            upperCaseComponent.imageColor = .green
            
        } else {
            
            upperCaseComponent.image = UIImage(systemName: "xmark")
            upperCaseComponent.imageColor = .red

        }
        
        if password.unicodeScalars.contains(where: {
            specialCharacters.contains($0) }) {
            
            specialCharComponent.image = UIImage(systemName: "checkmark")
            specialCharComponent.imageColor = .green
            
        } else {
            
            specialCharComponent.image = UIImage(systemName: "xmark")
            specialCharComponent.imageColor = .red

        }
    }
    
    //MARK: BUTTON ACTION
    @objc func handleAccountButtonTap() {
        
        guard
            
            let name = nameComponent.getTextField, !name.isEmpty,
            let email = emailComponent.getTextField, !email.isEmpty,
            let password = passwordComponent.getTextField, !password.isEmpty
                
        else {
            
            let alertView = AlertView(viewController: self)
            
            alertView.alertController.message = "Please, fill in all text fields."
            alertView.alertController.title = "Empty Fields."
            
            return
        }
        
        //MARK:  PASS VERIFICATION ACTION
        
        if switchButtom.isOn == true  {
            
            if password.contains(where: { Character in Character.isUppercase})
                && password.contains(where: { Character in Character.isNumber})
                && password.count >= 8
                && password.unicodeScalars.contains(where: { scalar in
                    specialCharacters.contains(scalar)}) {
                
                let userToSave = User(name: name, date: datePicker.date, email: email, password: password)
                
                Persistence.saveUser(newUser: userToSave)
                
                print("User saved!")
                
                navigationController?.popToRootViewController(animated: true)
                
            } else {
                
                let alertView = AlertView(viewController: self)
                
                alertView.alertController.title = "Weak Passoword."
                alertView.alertController.message = "Please, use a password that meets all requirements."
                
            }
        } else {
            
            let alertView = AlertView(viewController: self)
            
            alertView.alertController.title = "terms of service required!"
            alertView.alertController.message = "Please accept the terms of service."
            
        }
        
        if let existingUser {
            
            print(existingUser)
            
        }
    }
}
