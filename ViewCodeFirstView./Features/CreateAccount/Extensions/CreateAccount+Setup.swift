//
//  Untitled.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 30/04/25.
//

import UIKit

extension CreateAccountViewController: ViewSetupProtocol {
    

    
    //MARK: SUB VIEWS
    func addSubViews() {

        view.backgroundColor = .backSecondary
        view.addSubview(accountTitleLabel)
        view.addSubview(mainStack)
        view.addSubview(AccountButton)
        
    }
    
    func setupConstraints() {
        //MARK: CONSTRAINTS
        NSLayoutConstraint.activate([
        
            accountTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 118),
            accountTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            accountTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            mainStack.topAnchor.constraint(equalTo: accountTitleLabel.bottomAnchor, constant: 32),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            AccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66),
            AccountButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            AccountButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            AccountButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    
    func setupAdditionalConfiguration() {
        
        passwordComponent.delegate = self
        
    }
}
