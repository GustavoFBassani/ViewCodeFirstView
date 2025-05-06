//
//  ButtonView.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.

import UIKit

class ButtonView: UIView {
    
    private lazy var buttonComponent: UIButton = {
       
        var button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 12
        button.backgroundColor = .accent
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
        
    }()
    
    var addButtonAction: (() -> Void)?

    @objc func buttonAction() {
        
        addButtonAction?()
        
    }
    
    var buttonTitle: String? {
        didSet {
            
            buttonComponent.setTitle(buttonTitle, for: .normal)
            
        }
    }
    
    var buttonBackGroundColor : UIColor? {
        didSet {
            
            buttonComponent.backgroundColor = buttonBackGroundColor
        }
    }
    
    var buttonTextColor: UIColor? {
        didSet {
            
            buttonComponent.setTitleColor(buttonTextColor, for: .normal)
            
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

extension ButtonView: ViewSetupProtocol {
    func addSubViews() {
        
        addSubview(buttonComponent)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            buttonComponent.topAnchor.constraint(equalTo: self.topAnchor),
            buttonComponent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonComponent.heightAnchor.constraint(equalToConstant: 46)
        
        ])
    }
    
    
}
