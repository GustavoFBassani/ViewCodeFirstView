//
//  TableViewCell.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

class CellTableView: UITableViewCell {
    
    static let reuseIdentifier = "TaskCell-Identifies"
    
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
    
    
    var action: () -> Void = { }
    
    // chamando o action que recebeu a atribuicao de buttonaction na config
    @objc func buttonTapped() {
        action()
    }
    
    lazy var stack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [buttonCircle, label])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 12
        
        return stack
        
    }()
    
    //MARK: INICIAL CELL CONFIG
    func config(labelText: String,
                taskIsDone: Bool,
                buttonAction: @escaping () -> Void) {
        
        label.text = labelText
        
        buttonCircle.setImage(UIImage(systemName: taskIsDone ? "checkmark.circle.fill" : "circle") , for: .normal)
        
        //atribui ao action o buttonAction que eu defini lá na cell
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

