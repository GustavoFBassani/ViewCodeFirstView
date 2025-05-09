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
            
            let taskName:String? = taskNameComponent.getTextField

            let newTask = Task(tasksTypeEnum: enumTask, taskName: taskName ?? "")
            
            TasksPersistence.addTaskAndSave(task: newTask)
            
        }
    
        delegate?.didAddTask()
        
        cleanViewValues()
        
        dismiss(animated: true)
        
    }
}
