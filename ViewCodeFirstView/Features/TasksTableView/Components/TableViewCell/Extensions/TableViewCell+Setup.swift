//
//  TableViewCell+Setup.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

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
