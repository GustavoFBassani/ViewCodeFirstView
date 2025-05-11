//
//  Tasks.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//
import Foundation

struct Task: Codable {
    
    var id = UUID()
    var tasksTypeEnum: TaskEnum
    var taskName: String
    var taskIsDone: Bool = false
    var taskDetails: String
    
}
