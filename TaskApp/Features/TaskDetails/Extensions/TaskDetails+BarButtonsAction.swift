//
//  NewTask+BarButtonsConfig.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//
import Foundation

extension TaskDetailsViewController {
 
    @objc func dismisOnTap() {
        
        dismiss(animated: true)
        
    }
    
    @objc func addButtonTapped() {
                
        recoveredTask?.taskName = NameComponent.getAndSetTextField ?? ""
        recoveredTask?.taskIsDone = statusComponent.taskIsDone
        recoveredTask?.taskDetails = descriptions.taskTextField ?? ""
                
        var taskList = TasksPersistence.getAllTasks().allTasks
        
        let index = taskList.firstIndex(where: {$0.id == recoveredTask?.id })
        
        if let recoveredTask {
            
            taskList[index ?? 0] = recoveredTask
            
        }
        
        TasksPersistence.saveTask(allTasksToSave: AllTasks(allTasks: taskList))
        
        dismiss(animated: true)
        
        delegate?.didAddTask()
        
    }
}
