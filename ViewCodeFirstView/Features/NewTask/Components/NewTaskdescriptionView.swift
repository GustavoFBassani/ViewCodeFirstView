//
//  descriptionView.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//

import UIKit

class DescriptionView: UIView {
    
    //MARK: LABEL
    private lazy var componentLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.textColor = .labPrimary
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
        
    }()
    
    //MARK: TEXTFIELD
    private lazy var componentTextField: UITextField = {
        
        var textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        textField.leftViewMode = .always
        textField.backgroundColor = .backTertiary
        textField.layer.cornerRadius = 12
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "More details about task",
            attributes: [
                .foregroundColor: UIColor.labSecondary,
                .font: UIFont.systemFont(ofSize: 17)
            ]
        )
        
        return textField
        
    }()
    
    //MARK: GET TEXTFIELD TASK
    
    var taskTextField: String?  { get { componentTextField.text } }
    
    var setTextField: String? {
        didSet {
            
            componentTextField.text = setTextField
            
        }
    }

    //MARK: INITS
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
}

extension DescriptionView: ViewSetupProtocol {

    
    func addSubViews() {
        
        addSubview(componentLabel)
        addSubview(componentTextField)
        
    }
        
    //MARK: CONSTRAINTS
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            componentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            componentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            componentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            componentLabel.heightAnchor.constraint(equalToConstant: 21),
            
            componentTextField.topAnchor.constraint(equalTo: componentLabel.bottomAnchor, constant: 8),
            componentTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            componentTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            componentTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            componentTextField.heightAnchor.constraint(equalToConstant: 112)
            
        ])
        
    }
}
