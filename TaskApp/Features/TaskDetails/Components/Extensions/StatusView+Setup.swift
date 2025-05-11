//
//  EditingTask+Setup.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//
import UIKit

extension StatusView: ViewSetupProtocol {
    
    func addSubViews() {
        
        addSubview(statusStack)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        
            statusStack.topAnchor.constraint(equalTo: self.topAnchor),
            statusStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            statusStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            statusStack.heightAnchor.constraint(equalToConstant: 46)
        
        ])
    }
}
