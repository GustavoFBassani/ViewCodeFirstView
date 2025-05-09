//
//  Untitled.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//

import UIKit

extension EmptyStateView: ViewSetupProtocol {
    func addSubViews() {
//        view.addSubview(tasksTitle)
        addSubview(mainStack)
        addSubview(buttonComponent)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            mainImage.heightAnchor.constraint(equalToConstant: 72),
            mainImage.widthAnchor.constraint(equalToConstant: 92),
            
            mainStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 312),
            mainStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonComponent.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 32),
            buttonComponent.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonComponent.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        backgroundColor = .backPrimary
        

    }
}

