//
//  AlertView.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 02/05/25.
//

import UIKit

class AlertView: UIView {
    
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Ok.", style: .cancel)
    
    init(viewController: UIViewController) {
        
        super.init(frame: .zero)
        
        alertController.addAction(alertAction)

        viewController.present(alertController, animated: true)

    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
}


