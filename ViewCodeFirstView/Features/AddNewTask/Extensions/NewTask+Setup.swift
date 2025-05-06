//
//  NewTask+Seti[.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//
import UIKit

extension NewTaskViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(taskComponent)
        view.addSubview(mainStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 129),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            descriptionComponent.heightAnchor.constraint(equalToConstant: 141),
            
            categoryComponent.heightAnchor.constraint(equalToConstant: 44),

        ])
        
        
        
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backSecondary
                
    }
    
    
}
