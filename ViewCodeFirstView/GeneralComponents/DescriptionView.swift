//
//  descriptionView.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//

import UIKit

class DescriptionView: UIView {
    
    //MARK: LABEL
    lazy var descriptionLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.textColor = .labPrimary
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
        
    }()
    
    lazy var descriptionTextField: UITextView = {
       
        var textField = UITextView()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "More details about task"
        textField.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) // ou conforme seu design
        textField.textAlignment = .left
        textField.isScrollEnabled = true
        textField.isEditable = true
        textField.isSelectable = true
        textField.font = .systemFont(ofSize: 17)
        textField.textColor = .labSecondary
        textField.backgroundColor = .backTertiary
        textField.layer.cornerRadius = 8
        
        return textField
        
    }()
    
    //MARK: GET TEXTFIELD TASK
    
    var taskTextField: String?  {
        
        set {descriptionTextField.text = newValue }
        get { descriptionTextField.text }
        
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
        
        addSubview(descriptionLabel)
        addSubview(descriptionTextField)
        
    }
        
    //MARK: CONSTRAINTS
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 21),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            descriptionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 112)
            
        ])
        
    }
}
