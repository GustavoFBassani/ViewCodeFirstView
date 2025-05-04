//
//  ViewCodeProtocol.swift
//  ViewCodeFirstView.
//
//  Created by Gustavo Ferreira bassani on 02/05/25.
//

import Foundation

protocol ViewSetupProtocol {
    func addSubViews()
    func setupConstraints()
    func setup()
}

extension ViewSetupProtocol {
    func setup() {
        addSubViews()
        setupConstraints()
    }
}
