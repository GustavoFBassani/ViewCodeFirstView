//
//  UIViewControler+Keyboard.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 04/05/25.
//

import UIKit


extension UIViewController {
    
    func setupGestureRecognizer() {
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        
    }
    
}
