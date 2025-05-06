//
//  LoginSetup.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 30/04/25.
//

import UIKit

extension LoginViewController: ViewSetupProtocol {
    //MARK: SUBVIEWS
    func addSubViews() {
        
        view.addSubview(headerView)
        view.addSubview(mainView)
        view.addSubview(loginLabel)
        view.addSubview(mainStack)
        view.addSubview(buttonStack)
        view.addSubview(forgotPasswordButton)
        view.addSubview(wrongAccountWarning)
        
    }
    
    //MARK: CONSTRAINTS
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 281),
            
            logoStack.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logoStack.trailingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logoStack.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 98),
            
            mainView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -38),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mainView.heightAnchor.constraint(equalToConstant: 182),
            
            loginLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 32),
            loginLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -16),
            
            mainStack.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 86),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            loginButtonComponent.heightAnchor.constraint(equalToConstant: 50),
            createAccountButtonComponent.heightAnchor.constraint(equalToConstant: 50),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 218 ),
            
            wrongAccountWarning.topAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -64),
            wrongAccountWarning.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            wrongAccountWarning.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backSecondary

        // MARK: HEADER GRADIENT
        let gradientStart: UIColor = .gradientStart
        let gradientEnd: UIColor = .gradientEnd
        
        gradientLayer.colors = [gradientStart.cgColor,gradientEnd.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        headerView.layer.insertSublayer(gradientLayer, at: 0)

    }
}
