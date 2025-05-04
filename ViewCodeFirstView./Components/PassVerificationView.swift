//
//  PassVerificationView.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 03/05/25.
//

import UIKit

class PassVerificationView: UIView {
    
    private lazy var imageComponent: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "xmark")
        image.tintColor = .red
        
        return image
        
    }()
    
    private lazy var labelComponent: UILabel = {
        
        var label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SFProText-Regular", size: 13)
        label.textColor = .labPrimary
        label.text = ""
        
        return label
        
    }()
    
    var labelText:String? {
        didSet {
            
            labelComponent.text = labelText
            
        }
    }
    
    var image: UIImage? {
        didSet {
            
            imageComponent.image = image
            
        }
    }
    
    var imageColor: UIColor? {
        didSet {
            
            imageComponent.tintColor = imageColor
            
        }
    }
    
    lazy var stackComponent:UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [imageComponent,labelComponent])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        
        return stack
        
    }()
  
    //MARK: INITS
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension PassVerificationView:ViewSetupProtocol {
    func setupAdditionalConfiguration() {
        <#code#>
    }
    
    
    func addSubViews() {
        
        addSubview(stackComponent)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            stackComponent.topAnchor.constraint(equalTo: self.topAnchor),
            stackComponent.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackComponent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackComponent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackComponent.heightAnchor.constraint(equalToConstant: 18),
            
            imageComponent.heightAnchor.constraint(equalToConstant: 10),
            imageComponent.widthAnchor.constraint(equalToConstant: 10),
            imageComponent.leadingAnchor.constraint(equalTo: stackComponent.leadingAnchor, constant: 16)
        
        ])
    }
}
