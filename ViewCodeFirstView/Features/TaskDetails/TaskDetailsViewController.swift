//
//  EditingTaskViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    var recoveredTask: Task?
    
    lazy var NameComponent: TextFieldWithTitleView = {
        
        let task = TextFieldWithTitleView()
        task.translatesAutoresizingMaskIntoConstraints = false
        task.labelText = "Task"
        task.textFieldBackGroundColor = .backTertiary
        task.textFieldPlaceHolderTextColor = .labTertiary
        task.getAndSetTextField = recoveredTask?.taskName
        
        return task
        
    }()
    
    lazy var statusComponent: StatusView = {
        
        let statusView = StatusView()
        
        
        guard let task = recoveredTask else { fatalError() }
        
        print(task.taskIsDone)
        statusView.taskIsDone = task.taskIsDone
        statusView.changeButtonStatus()
       
        return statusView
        
    }()
    
    lazy var categoriesComponent: categoryView = {
        
        let category = categoryView()
        
        category.selectedTask = recoveredTask?.tasksTypeEnum
        
        return category
        
    }()
    
    lazy var descriptions: DescriptionView = {
        
        let description = DescriptionView()
        description.taskTextField = recoveredTask?.taskDetails
        
        return description
        
    }()
    
    weak var delegate: addTaskDelegate?
    
    lazy var mainStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [NameComponent,categoriesComponent,statusComponent,descriptions])
        
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


