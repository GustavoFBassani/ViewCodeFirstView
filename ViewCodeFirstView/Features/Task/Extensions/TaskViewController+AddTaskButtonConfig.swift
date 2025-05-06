//
//  TaskViewController+LoginButtonConfig.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//
import Foundation

extension TaskViewController {
    
    @objc func handleAccountButtonTap() {
        
        let newTaskViewController = NewTaskViewController()
        newTaskViewController.modalPresentationStyle = .pageSheet
        
        present(newTaskViewController, animated: true)
        
    }
}
