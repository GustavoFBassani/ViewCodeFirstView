//
//  NewTask+BarButtonsConfig.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//
import Foundation

extension NewTaskViewController {
 
    @objc func dismisOnTap() {
        
        dismiss(animated: true)
        
    }
    
    @objc func addButtonTapped() {
        
        if let enumTask = categoryComponent.selectedTask {
            
            let taskName:String? = taskNameComponent.getAndSetTextField
            
            let description = descriptionComponent.taskTextField

            let newTask = Task(tasksTypeEnum: enumTask, taskName: taskName ?? "", taskDetails: description ?? "")
        
            TasksPersistence.addTaskAndSave(task: newTask)
            
        }
    
        delegate?.didAddTask()
        
        cleanViewValues()
        
        dismiss(animated: true)
        
    }
}
