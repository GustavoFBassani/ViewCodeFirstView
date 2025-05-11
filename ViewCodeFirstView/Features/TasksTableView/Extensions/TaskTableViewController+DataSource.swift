//
//  Untitled 2.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//
import UIKit

extension TaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        sections[section].rawValue.uppercased()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        emptyState.isHidden = !sections.isEmpty
        tableView.isHidden = sections.isEmpty
        
        return sections.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rows[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        var task = getTaskByIndexPath(by: indexPath)
        
        cell.config(labelText: task.taskName, taskIsDone: task.taskIsDone, buttonAction: {
            [weak self] in
            
            // passando pra config tudo isso
            
            // atualizar ela
            task.taskIsDone.toggle()
            // pegar todas as tasks
            var taskList = TasksPersistence.getAllTasks().allTasks
            // atualizar na lista
            let index = taskList.firstIndex(where: {$0.id == task.id})!
            taskList[index] = task
            // salvar
            TasksPersistence.saveTask(allTasksToSave: AllTasks(allTasks: taskList))
            
            self?.didAddTask()
        })
        
        return cell
        
    }
    
}
