//
//  TasksPersistence.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 07/05/25.
//

import Foundation

let tasksKey = "tasksKey"

struct TasksPersistence {
    
    static func getAllTasks() -> AllTasks {
        
        if let data = UserDefaults.standard.value(forKey: tasksKey) as? Data {
            
            do {
                
                let decoder = JSONDecoder()
                let decodedAllTasks = try decoder.decode(AllTasks.self, from: data)
                
                return decodedAllTasks
                
            } catch {
                
                print(error.localizedDescription)
            }
        }
        
        let newAllTasks = AllTasks(allTasks: [])
        
        return newAllTasks
        
    }
    
    static func saveTask(allTasksToSave: AllTasks) {
        
        do {
            
            let encoder = JSONEncoder()
            let encodedAllTasks = try encoder.encode(allTasksToSave)
            
            UserDefaults.standard.set(encodedAllTasks, forKey: tasksKey)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    static func addTaskAndSave(task: Task) {
        
        var allTasksUpdated = getAllTasks()
        allTasksUpdated.allTasks.append(task)
        
        saveTask(allTasksToSave: allTasksUpdated)
        
    }
    
    static func deleteTasksAndSave(by id: UUID) {
        
        var allTasksUpdated = getAllTasks()
        
        allTasksUpdated.allTasks.removeAll { task in task.id == id }
        
        saveTask(allTasksToSave: allTasksUpdated)
        
    }
}
