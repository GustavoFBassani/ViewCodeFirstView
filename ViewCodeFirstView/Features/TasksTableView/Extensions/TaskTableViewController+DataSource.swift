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
        
        let task = getTask(by: indexPath)
        
        cell.config(labelText: task.taskName, taskIsDone: false) {
            [weak self] in
            
        }
        
        return cell
        
    }
    
}
