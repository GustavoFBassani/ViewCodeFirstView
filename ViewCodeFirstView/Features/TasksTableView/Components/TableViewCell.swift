//
//  TableViewCell.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "PetCell-Identifies"
    
    lazy var buttonCircle: UIButton = {
        
        var button = UIButton()
        
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button

    }()
    
    lazy var label: UILabel = {
        
        var label = UILabel()
        
        label.textColor = .label
        
        return label
        
    }()
    
    var taskIsDone = false
    
    var action: () -> Void = { }
    
    @objc func buttonTapped() {
        
        action()
        
        taskIsDone.toggle()

        buttonCircle.setImage(UIImage(systemName: taskIsDone ? "checkmark.circle.fill" : "circle") , for: .normal)
        
    }
    
    lazy var stack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [buttonCircle, label])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 12
        
        return stack
        
    }()
    
    func config(labelText: String,
                taskIsDone: Bool,
                buttonAction: @escaping () -> Void) {
        
        label.text = labelText
        
        buttonCircle.setImage(UIImage(systemName: taskIsDone ? "checkmark.circle.fill" : "circle") , for: .normal)
        
        self.taskIsDone = taskIsDone
        
        self.action = buttonAction
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension TableViewCell: ViewSetupProtocol {
    func addSubViews() {
        
        contentView.addSubview(stack)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
            
        ])
    }
}
