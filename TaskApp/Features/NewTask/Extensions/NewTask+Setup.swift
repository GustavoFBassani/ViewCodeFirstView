//
//  NewTask+Seti[.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//
import UIKit

extension NewTaskViewController: ViewSetupProtocol {
    func addSubViews() {
        
        if let navController = navigationController {
         
            let navBar = navController.navigationBar
            
            view.addSubview(navBar)

        }
        
      view.addSubview(taskNameComponent)
        view.addSubview(mainStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            mainStack.topAnchor.constraint(equalTo: navigationController?.navigationBar.bottomAnchor ?? view.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            descriptionComponent.heightAnchor.constraint(equalToConstant: 141),
            
            categoryComponent.heightAnchor.constraint(equalToConstant: 44),

        ])
        
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = .backSecondary
        
        //MARK: NAVIGATION TITLE
        let title = UILabel()
        title.text = "New Task"
        title.textColor = .labPrimary
        
        navigationItem.titleView = title
        
        //MARK: NAGIVATION CANCEL BUTTON
        let cancelButton = UIButton(type: .system)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.tintColor = .accent
        cancelButton.addTarget(self, action: #selector(dismisOnTap), for: .touchUpInside)
        let cancelButtonItem = UIBarButtonItem(customView:cancelButton)
        
        navigationItem.leftBarButtonItem = cancelButtonItem
    
        //MARK: NAVIGATION ADD BUTTON
        let addButton = UIButton(type: .system)
        
        addButton.setTitle("add", for: .normal)
        addButton.tintColor = .accent
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        let addButtonItem = UIBarButtonItem(customView:addButton)
        
        navigationItem.rightBarButtonItem = addButtonItem
        
    }
    
}


