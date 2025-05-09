//
//  EditingTaskViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    var taskTitle: String?
    var taskCategory: String?
    
    lazy var NameComponent: TextFieldWithTitleView = {
        
        let task = TextFieldWithTitleView()
        task.translatesAutoresizingMaskIntoConstraints = false
        task.labelText = "Task"
        task.textFieldBackGroundColor = .backTertiary
        task.textFieldPlaceHolderTextColor = .labTertiary
        
        return task
        
    }()
    
    lazy var statusComponent = StatusView()
    
    lazy var categoriesComponent = categoryView()
    
    lazy  var descriptionComponent =  DescriptionView()
    
    weak var delegate: addTaskDelegate?
    
    lazy var mainStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [NameComponent,categoriesComponent,statusComponent,descriptionComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.axis = .vertical
        
        return stack
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setup()

    }
    
}
