//
//  TaskViewController+AddTaskButtonAction.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//
import Foundation
import UIKit

extension TaskViewController {
    
    @objc func handleAccountButtonTap() {
        
        let newTaskVC = NewTaskViewController()
        newTaskVC.delegate = self
        let navController = UINavigationController(rootViewController: newTaskVC)
        present(navController, animated: true)
        
    }
}


