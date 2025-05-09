//
//  Untitled.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//

import UIKit

extension TaskViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {[weak self] (deleteAction, view, completionHandler) in
            
            
            if let taskToDelete = self?.getTask(by: indexPath) {
                
                TasksPersistence.deleteTasksAndSave(by: taskToDelete.id)
                self?.allTasksRecovered = TasksPersistence.getAllTasks()
            }
            
            completionHandler(true)
            
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipe
        
    }
}
