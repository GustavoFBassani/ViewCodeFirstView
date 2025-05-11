//
//  Profile+sETUP.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//

import UIKit

extension ProfileViewController: ViewSetupProtocol {
    func addSubViews() {
        view.addSubview(profileTitle)
        view.addSubview(mainStack)
        view.addSubview(buttonStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            dateLabel.widthAnchor.constraint(equalToConstant: 247),
            
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            deleteAccountButtonComponent.heightAnchor.constraint(equalToConstant: 50),
            signOutButtonComponent.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backSecondary
        
        //MARK: NAVIGATION BAR TITLE
        let customNavigationTitle = UIBarButtonItem(customView: profileTitle)
        
        navigationItem.leftBarButtonItem = customNavigationTitle
        
    }
}
