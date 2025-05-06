//
//  HomeViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//

import UIKit

class TaskViewController: UIViewController {
    
    //MARK: TASK TITLE
    lazy var tasksTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tasks"
        label.textColor = .primWhite
        label.font = UIFont(name: "SFProRounded-Bold", size: 34)
        
        return label
    }()
    
    //MARK: IMAGE
    lazy var mainImage: UIImageView = {
        
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Illustration")
        image.contentMode = .scaleAspectFit
        
        return image
        
    }()
    
    //MARK: TASK LABEL
    lazy var noTaskLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No tasks yet!"
        label.textColor = .labPrimary
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
        
    }()
    
    //MARK: ADD TASK LABEL
    lazy var addTaskLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add a new task and it will up here!"
        label.textColor = .labSecondary
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
        
    }()
    
    //MARK: LABEL STACK
    lazy var stackLabels: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [noTaskLabel,addTaskLabel])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        
        return stack
        
    }()
    
    //MARK: MAIN STACK
    lazy var mainStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [mainImage,stackLabels])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 8
        
        return stack
        
    }()
    
    //MARK: ADD TASK BUTTON
    lazy var buttonComponent: ButtonView = {
        
        let button = ButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Add New Task"
        button.buttonBackGroundColor = .accent
        button.buttonTextColor = .labPrimary
        button.addButtonAction = {self.handleAccountButtonTap()}
        
        return button
        
    }()
    
    override func viewDidLoad() {
        
        setup()
        
    }
    
}
