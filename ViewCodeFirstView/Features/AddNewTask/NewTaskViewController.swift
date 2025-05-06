//
//  NewTaskViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//
import UIKit

class NewTaskViewController: UIViewController {
    
    lazy var taskComponent: TextFieldWithTitleView = {
        
        let task = TextFieldWithTitleView()
        task.translatesAutoresizingMaskIntoConstraints = false
        task.labelText = "Task"
        task.textFieldBackGroundColor = .backTertiary
        task.textFieldPlaceHolderTextColor = .labTertiary
        task.textFieldplaceHolder = "Your task name here"
        
        return task
        
    }()
        
    
    lazy var categoryComponent = categoryView()
    
    lazy  var descriptionComponent = DescriptionView()
    
    lazy var mainStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [taskComponent,categoryComponent,descriptionComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.axis = .vertical
        
        return stack
        
    }()
    
    override func viewDidLoad() {
        
        setup()
        
    }
    
}
