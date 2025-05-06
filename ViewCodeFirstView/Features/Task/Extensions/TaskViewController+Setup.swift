//
//  Untitled.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//

import UIKit

extension TaskViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(tasksTitle)
        view.addSubview(mainStack)
        view.addSubview(buttonComponent)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            tasksTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            tasksTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            mainImage.heightAnchor.constraint(equalToConstant: 72),
            mainImage.widthAnchor.constraint(equalToConstant: 92),
            
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 312),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonComponent.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 32),
            buttonComponent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonComponent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backPrimary
        
    }
}

