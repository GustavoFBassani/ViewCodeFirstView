//
//  TaskView+Setup.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//

import UIKit

extension TaskViewController: ViewSetupProtocol {
    func addSubViews() {
        
        view.addSubview(emptyState)
        view.addSubview(tableView)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            emptyState.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyState.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyState.topAnchor.constraint(equalTo: view.topAnchor),
            emptyState.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
        
    }
    
    func setupAdditionalConfiguration() {
        
        //MARK: NAVIGATION BAR TITLE
        
        //does not comply with figma
//        let customNavigationTitle = UIBarButtonItem(customView: tasksTitle)
    
//        navigationItem.leftBarButtonItem = customNavigationTitle
        
        title = "Tasks"
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationController?.navigationBar.largeTitleTextAttributes
        = [
            
            .font: UIFont(name: "SFProRounded-Bold", size: 34) as Any,
            .foregroundColor: UIColor.labPrimary
            
        ]
        
        //MARK: NAVIGATION BAR BUTTON
        
        //two different ways to do
        // 1) more customization possibilities
        let customButtom = UIBarButtonItem(customView:addTaskButton)
        
        // 2)faster and easy to do
        //let customButtom = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: <#T##Selector?#>)

        navigationItem.rightBarButtonItem = customButtom
        
    }
    
    
}
