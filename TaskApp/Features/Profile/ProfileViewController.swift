//
//  ProfileViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: RECOVERING LOGGED USER
    lazy var user: User? = {
        do {
            
            if let userEncoded = UserDefaults.standard.data(forKey: keyUserLogged) {
                
                let decoder = JSONDecoder()
                let decodedUser = try decoder.decode(User.self, from: userEncoded)
                
                return decodedUser
                
            }
            
        } catch {
            
            print(error.localizedDescription)
            
        }
        
        return nil
        
    }()
    
    //MARK: PROFILE TITLE LABEL
    lazy var profileTitle: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.font = UIFont(name: "SFProRounded-Bold", size: 34)
       
        return label
        
    }()
    
    //MARK: NAME STACK
    lazy var nameComponent: TextFieldWithTitleView = {
        
        let name = TextFieldWithTitleView()
        
        name.labelText = "Name"
        name.textFieldText = user?.name
        name.textFieldEnableToEdit = false
        
        return name
        
    }()
    
    //MARK: DATA
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
        
        if let userDate = user?.date {
            date.date = userDate
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

    
    //MARK: EMAIL STACK
    lazy var emailComponent: TextFieldWithTitleView = {
        
        let email = TextFieldWithTitleView()
        
        email.translatesAutoresizingMaskIntoConstraints = false
        email.labelText = "Email"
        email.textFieldText = user?.email
        email.textFieldplaceHolder = ""
        email.textFieldEnableToEdit = false
        
        return email
        
    }()
    
    //MARK: MAIN STACK
    lazy var mainStack: UIStackView = {
        
        var stack = UIStackView(arrangedSubviews: [nameComponent,dateStack,emailComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
       
        return stack
        
    }()
    
    //MARK: SIGN OUT BUTTON
    lazy var signOutButtonComponent: ButtonView = {
        
        var button = ButtonView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Sign out"
        button.buttonTextColor = .accent
        button.buttonBackGroundColor = .backTertiary
        button.addButtonAction = {self.signOut()}
        
        return button
        
    }()
    
    //MARK: DELETE ACC BUTTON
    lazy var deleteAccountButtonComponent: ButtonView = {
        
        var button = ButtonView()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.buttonTitle = "Delete Account"
        button.buttonTextColor = .error
        button.buttonBackGroundColor = .backTertiary
        button.addButtonAction = {self.deleteAccount()}
        
        return button
        
    }()
    
    //MARK: BUTTON STACK
    lazy var buttonStack: UIStackView = {
    
        var stack = UIStackView(arrangedSubviews: [signOutButtonComponent,deleteAccountButtonComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 16
        stack.axis = .vertical
        
        return stack
        
    }()
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        
        setup()
        
    }
}
