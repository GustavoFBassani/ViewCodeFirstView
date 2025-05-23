//
//  EmptySate.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//
import UIKit

class EmptyStateView: UIView {
    
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
            
            return button
            
        }()
    
    // MARK: INITS
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
