//
//  StatusView.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

class StatusView: UIView {
    
    lazy var statusButton: UIButton = {
        
        var button = UIButton()
        
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button

    }()
        
    var taskIsDone = true
    
    @objc func buttonTapped() {
                
        taskIsDone.toggle()

        statusButton.setImage(UIImage(systemName: taskIsDone ? "checkmark.circle.fill" : "circle") , for: .normal)
        
    }
    
    func changeButtonStatus() {
        
        statusButton.setImage(UIImage(systemName: taskIsDone ? "checkmark.circle.fill" : "circle") , for: .normal)
        
    }
    
    lazy var statusLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Status"
        label.textAlignment = .left
        label.textColor = .labPrimary
        label.font = UIFont.systemFont(ofSize: 17)
    
        return label
        
    }()
        
    lazy var statusStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [statusButton,statusLabel])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.backgroundColor = .backTertiary
        stack.layer.cornerRadius = 8
        
        return stack
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

