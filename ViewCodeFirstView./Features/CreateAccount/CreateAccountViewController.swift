//
//  createAccount.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 30/04/25.
//

import UIKit

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: VARS
    let specialCharacters = CharacterSet.punctuationCharacters.union(.symbols)
    let existingUser = Persistence.getUser()?.users
    

    //MARK: TITLE LABEL
    lazy var accountTitleLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create Account"
        label.textAlignment = .center
        label.textColor = .labPrimary
        label.font = UIFont(name: "SFProRounded-Bold", size: 34)
        
        return label
    }()
    
    //MARK: NAME COMPONENT
    
    lazy var nameComponent: TextFieldWithTitleView = {
        
        let name = TextFieldWithTitleView()
        
        name.labelText = "Full Name"
        name.textFieldplaceHolder = "Your name here"
    
        return name
        
    }()
    
    //MARK: DATE PICKER
    lazy var dateLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date of Birth"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .labPrimary
        
        return label
    }()
    lazy var datePicker: UIDatePicker = {
        
        let date = UIDatePicker()
        
        date.datePickerMode = .date
        date.preferredDatePickerStyle = .compact
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        if let customDate = formatter.date(from: "2024/06/10") {
            date.setDate(customDate, animated: false)
        }
        
        return date
    }()
    
    lazy var dateStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [dateLabel,datePicker])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        
        return stack
        
    }()
    
    //MARK: PASSWORD COMPONENT
    
    lazy var passwordComponent: TextFieldWithTitleView = {
        
        let password = TextFieldWithTitleView()
        
        password.labelText = "Password"
        password.textFieldplaceHolder = "********"
        
        return password
    }()
 
    
    //MARK: PASSWORD VERIFICATION COMPONENTS

    lazy var lessCharComponent: PassVerificationView = {
        
        let lessChar = PassVerificationView()
        
        lessChar.labelText = "At least 8 characters"
        
        return lessChar
        
    }()
    
    lazy var oneNumberComponent: PassVerificationView = {
        
        let oneNumber = PassVerificationView()
        
        oneNumber.labelText = "At least 1 number"
        
        return oneNumber
        
    }()
    
    lazy var upperCaseComponent: PassVerificationView = {
        
        let upperCase = PassVerificationView()
        
        upperCase.labelText = "At least 1 uppercase letter"
        
        return upperCase
        
    }()
    
    lazy var specialCharComponent: PassVerificationView = {
        
        let specialChar = PassVerificationView()
        
        specialChar.labelText = "At least 1 special character"
        
        return specialChar
        
        
    }()
    
    //MARK: PASSWORD STACKS
    
    lazy var passwordVerificationStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [lessCharComponent,oneNumberComponent,upperCaseComponent  ,specialCharComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        
        return stack
        
    }()
    
    lazy var passwordStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [passwordComponent, passwordVerificationStack])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        
        return stack
        
    }()
    
   //MARK: EMAIL COMPONENT
    
    lazy var emailComponent: TextFieldWithTitleView = {
        
        let email = TextFieldWithTitleView()
        
        email.labelText = "Email"
        email.textFieldplaceHolder = "abc@abc.com"
        
        return email
        
    }()
    
    
    //MARK: TERMS SERVICE
    lazy var switchButtom: UISwitch = {
        
        var switchButtom = UISwitch()
        
        switchButtom.isOn = false
        
        return switchButtom
        
    }()
    
    lazy var switchLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I accept the term and privacy policy"
        label.textColor = .labPrimary
        
        return label
        
    }()
    
    lazy var switchStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [switchButtom,switchLabel])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
        
    }()
    
    
    //MARK: MAIN STACK
    lazy var mainStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [nameComponent,dateStack,emailComponent,passwordStack,switchStack])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        
        return stack
    }()
    
    //MARK: CREATE ACCOUNT BUTTON
    lazy var AccountButton: UIButton = {
        
        var button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 12
        button.backgroundColor = .accent
        
        button.addTarget(self, action: #selector(handleAccountButtonTap), for: .touchUpInside)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        
        setup()
        setupGestureRecognizer()
        
    }
    
}

