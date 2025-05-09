//
//  Untitled 2.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 09/05/25.
//
import UIKit

extension TaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        sections[section].rawValue
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let allTasksOfSection = rows[indexPath.section]
        let taskForRowAt = allTasksOfSection[indexPath.row]
        
        let task = getTask(by: indexPath)
        
        var config = cell.defaultContentConfiguration()
        
        config.text = task.taskName
        config.image = UIImage(systemName: task.tasksTypeEnum.imageName)
        
        cell.contentConfiguration = config
        
        return cell
        
    }
    
}
