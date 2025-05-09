//
//  Tasks.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//
import Foundation

struct Task: Codable {
    
    var id = UUID()
    let tasksTypeEnum: TaskEnum
    let taskName: String
    
}
