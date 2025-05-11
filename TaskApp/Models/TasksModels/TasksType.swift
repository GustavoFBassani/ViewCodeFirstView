//
//  Tasks.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//

import Foundation

enum TaskEnum: String, CaseIterable, Codable {
    
    case Education
    case Fitness
    case Groceries
    case Health
    case Home
    case Personal
    case Reading
    case Shopping
    case Travel

    var imageName: String {
        
        switch self {
        case .Groceries:
            return "fork.knife"
        case .Travel:
            return "airplane"
        case .Education:
            return "graduationcap.fill"
        case .Fitness:
            return "dumbbell.fill"
        case .Personal:
            return "person.fill"
        case .Reading:
            return "book.fill"
        case .Health:
            return "pills.fill"
        case .Home:
            return "house.fill"
        case .Shopping:
            return "cart.fill"
            
            
        }
    }
}
