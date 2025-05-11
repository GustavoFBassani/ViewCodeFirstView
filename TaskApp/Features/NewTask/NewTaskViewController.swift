//
//  NewTaskViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//
import UIKit

class NewTaskViewController: UIViewController {
        
    lazy var taskNameComponent: TextFieldWithTitleView = {
        
        let task = TextFieldWithTitleView()
        
        task.translatesAutoresizingMaskIntoConstraints = false
        task.labelText = "Task"
        task.textFieldBackGroundColor = .backTertiary
        task.textFieldPlaceHolderTextColor = .labSecondary
        task.textFieldplaceHolder = "Your task name here"
        
        return task
        
    }()
    
    lazy var categoryComponent = categoryView()
    
    lazy var descriptionComponent = DescriptionView()
    
    weak var delegate: addTaskDelegate?
    
    func cleanViewValues() {
        
        descriptionComponent.taskTextField = ""
        
        categoryComponent.selectedTask = nil
        
    }
    
    lazy var mainStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [taskNameComponent,categoryComponent,descriptionComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.axis = .vertical
        
        return stack
        
    }()
    
    override func viewDidLoad() {
        
        setup()
        
    }
}

extension NewTaskViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Seu placeholder" {
            textView.text = ""
            textView.textColor = .label
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Seu placeholder"
            textView.textColor = .labSecondary
        }
    }
}
