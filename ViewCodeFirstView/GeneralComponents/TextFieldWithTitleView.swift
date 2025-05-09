//
//  NameTextField.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 02/05/25.
//

import UIKit

class TextFieldWithTitleView: UIView {
    
    
    //MARK: LABEL
    private lazy var componentLabel: UILabel = {
        
        var label = UILabel()
        
        label.text = ""
        label.textColor = .labPrimary
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return label
        
    }()
    
    //MARK: TEXTFIELD
    private lazy var componentTextField: UITextField = {
        
        var textField = UITextField()
        
        textField.placeholder = ""
        textField.layer.cornerRadius = 8
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        textField.leftViewMode = .always
        textField.backgroundColor = .sepPrimary
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "",
            attributes: [
                .foregroundColor: UIColor.labSecondary,
                .font: UIFont.systemFont(ofSize: 17)
            ]
        )
        
        return textField
        
    }()

    //MARK: COMPONENT STACK
    lazy var componentStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [componentLabel,componentTextField])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        
        return stack
        
    }()
    
    //MARK: GETTERS
    var getTextField: String? {
        get {
            
            return componentTextField.text
            
        }
        set {
            
            componentTextField.text = newValue
        }
    }
    
    //MARK: SETTERS
    var delegate: UITextFieldDelegate? {
        didSet {
            
            componentTextField.delegate = delegate
            
        }
    }
    
    var labelText: String?  {
        didSet {
            
            componentLabel.text = labelText
            
        }
    }
    
    var textFieldBackGroundColor: UIColor? {
        didSet {
            
            componentTextField.backgroundColor = textFieldBackGroundColor
            
        }
    }
    
    var textFieldplaceHolder: String? {
        didSet {
            
            componentTextField.placeholder = textFieldplaceHolder
            
        }
    }
    
    var textFieldIsSecure: Bool? {
        didSet {
            
            if let Bool = textFieldIsSecure {
                
                componentTextField.isSecureTextEntry = Bool
                
            }
        }
        
    }
    
    var textFieldText: String? {
        didSet {
            
            componentTextField.text = textFieldText
            
        }
    }
    
    var textFieldBorderColor: UIColor? {
        didSet {
            
            componentTextField.layer.borderColor = textFieldBorderColor?.cgColor

        }
    }
    
    var textFieldBorder: CGFloat?  {
        didSet{
            
            componentTextField.layer.borderWidth = textFieldBorder ?? 0

        }
        
    }
    
    var textFieldPlaceHolderTextColor: UIColor? {
        didSet {
            componentTextField.attributedPlaceholder = NSAttributedString(string: "", attributes: [.foregroundColor: textFieldPlaceHolderTextColor ?? .black])
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

extension TextFieldWithTitleView: ViewSetupProtocol {

    
    func addSubViews() {
        
        addSubview(componentStack)
        
    }
        
    //MARK: CONSTRAINTS
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            componentStack.topAnchor.constraint(equalTo: self.topAnchor),
            componentStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            componentStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            componentStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            componentTextField.heightAnchor.constraint(equalToConstant: 46)
            
        ])
    }
}
