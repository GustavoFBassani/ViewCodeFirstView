//
//  ViewController.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 30/04/25.
//


import UIKit

class LoginViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    // MARK: HEADER
    lazy var titleLabel: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.textAlignment = .center
        label.textColor = .primWhite
        label.font = UIFont(name: "SFProRounded-Bold", size: 34)

        return label
        
    }()
    
    lazy var image: UIImageView = {
        
        var imageView = UIImageView()
        
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    lazy var logoStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [image,titleLabel])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 24
        
        return stack
        
    }()
    
    lazy var headerView: UIView = {
        
        let header = UIView()
        
        header.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(logoStack)
        
        return header
        
    }()
    
    // MARK: MAIN VIEW
    lazy  var mainView: UIView = {
        
        var view = UIView()
        
        view.backgroundColor = .backSecondary
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    //MARK: LOGIN LABEL
    lazy var loginLabel: UILabel = {
        
        var login = UILabel()
        
        login.translatesAutoresizingMaskIntoConstraints = false
        login.text = "Login"
        login.textColor = .labPrimary
        login.textAlignment = .center
        login.font = UIFont(name: "SFProRounded-Bold", size: 28)
        
        return login
        
    }()
    
    //MARK: EMAIL COMPONENT
    lazy var emailComponent: TextFieldWithTitleView = {
        
        let email = TextFieldWithTitleView()
        
        email.labelText  = "Email"
        email.textFieldplaceHolder = "abc@abc.com"
        
        return email
        
    }()
    
    //MARK: PASSWORD COMPONENT
    lazy var passwordComponent : TextFieldWithTitleView = {
        
        let passwordStack = TextFieldWithTitleView()
        
        passwordStack.labelText = "Password"
        passwordStack.textFieldplaceHolder = "********"
        passwordStack.textFieldIsSecure = true
        
        return passwordStack
        
    }()

    //MARK: FORGOT BUTTON
    lazy var forgotPasswordButton: UIButton = {
        
        var button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.textColor = .accent
        
        return button
        
    }()
    
    //MARK: MAIN STACK
    lazy var mainStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [emailComponent,passwordComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        
        return stack
        
    }()
    
    lazy var wrongAccountWarning: UILabel = {
        
        let warning = UILabel()
        
        warning.text = "The email and password you entered did not match our record. Please try again."
        warning.translatesAutoresizingMaskIntoConstraints = false
        warning.font = UIFont(name: "SFProText-Regular", size: 13)
        warning.textColor = .red
        warning.textAlignment = .center
        warning.isHidden = true
        warning.numberOfLines = 0
        
        return warning
        
    }()
    
    //MARK: LOGIN BUTTON
//    lazy var loginButton: UIButton = {
//        var button = UIButton()
//        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Login", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        button.backgroundColor = .accent
//        button.layer.cornerRadius = 12
//        button.addTarget(self, action: #selector(handleAccountButtonTap), for: .touchUpInside)
//        
//        return button
//        
//    }()
//    
//    //MARK: CREATE ACCOUNT BUTTON
//    lazy var createAccountButton: UIButton = {
//        var button = UIButton()
//        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Create Account", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        button.setTitleColor(.accent, for: .normal)
//        button.backgroundColor = .backTertiary
//        button.layer.cornerRadius = 12
//        button.addTarget(self, action: #selector(goToCreateAccount), for: .touchUpInside)
//        
//        return button
//    }()
    
    lazy var loginButtonComponent: ButtonView = {
        
        var button = ButtonView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Login"
        button.buttonBackGroundColor = .accent
        button.addButtonAction = {self.handleAccountButtonTap()}

        return button
        
        
    }()
    
    lazy var createAccountButtonComponent: ButtonView = {
        
        var button = ButtonView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Create Account"
        button.buttonBackGroundColor = .backTertiary
        button.buttonTextColor = .accent
        button.addButtonAction = {self.goToCreateAccount()}

        return button
        
        
    }()

    //MARK: BUTTON STACK
    lazy var buttonStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [loginButtonComponent, createAccountButtonComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        
        return stack
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
        setupGestureRecognizer()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradientLayer.frame = headerView.bounds
        
    }
    
    @objc private func goToCreateAccount() {
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: nil, action: nil)

        let createVC = CreateAccountViewController()
        navigationController?.pushViewController(createVC, animated: true)
        
    }
    
}


