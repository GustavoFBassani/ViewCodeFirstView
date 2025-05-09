//
//  HomeViewController.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 05/05/25.
//

import UIKit

class TaskViewController: UIViewController, addTaskDelegate {
    
    let cellIdentifier: String = "reusableCell"
        
    //MARK: TABLE VIEW
    lazy var tableView: UITableView = {
        
        var table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        return table
        
    }()
    
    //MARK: ADD TASK NAVIGATION BUTTON
    lazy var addTaskButton: UIButton = {
        
        var button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(handleAccountButtonTap), for: .touchUpInside)
        
        return button
        
    }()
    
    //MARK: EMPTY STATE VIEW
    lazy var emptyState: EmptyStateView = {
        
        var empty = EmptyStateView()
        empty.translatesAutoresizingMaskIntoConstraints = false
        empty.buttonComponent.addButtonAction = {self.handleAccountButtonTap()}
        
        return empty
    }()
    
    //MARK: TASKS LIST
    var sections: [TaskEnum] = []
    
    //MARK: LIST OF LISTS OF TASK
    var rows: [[Task]] = []
    
    //MARK: RELOADING TASKS
    var allTasksRecovered = TasksPersistence.getAllTasks() {
        didSet{
            
            print("Novas tasks:", allTasksRecovered.allTasks)
            buildContent()
            tableView.reloadData()
            
        }
    }

    //MARK: POPULATING SECTIONS
    func buildSections() -> [TaskEnum] {
        
        var sections: [TaskEnum] = []
        
        for taskOfEnum in TaskEnum.allCases {
            
            let hasTask = allTasksRecovered.allTasks.contains { taskToCompare in
                
                taskToCompare.tasksTypeEnum == taskOfEnum
                
            }
            
            if hasTask {
                
                sections.append(taskOfEnum)
                
            }
        }
        
        return sections
    }
    
    //MARK: POPULATING ROWS
    func buildRows() -> [[Task]] {
        
        var rows: [[Task]] = []
        
        for section in sections {
            
            let tasksPerSection = allTasksRecovered.allTasks.filter({ taskToCompare in
                taskToCompare.tasksTypeEnum == section
            })
            
            rows.append(tasksPerSection)
        }
        
        return rows
    }
    
    
    func buildContent() {
        
        sections = buildSections()
        rows = buildRows()
        
    }
    
    
    
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        
        buildContent()
        setup()
        
    }
    
    //MARK:
    func getTask(by indexPath: IndexPath) -> Task {
        
        // rows is an array of array of tasks... it means rows[0] -> first array of sections [tasks]  and so on...
        // rows[indexPath.section] -> [Task] of the section
        let tasksOfSection = rows[indexPath.section]
        // row[indexPath.section][indexPath.row] -> task of an list of tasks of an list of lists of tasks
        let task = tasksOfSection[indexPath.row]
        
        return task
        
    }
    
    //The function is called from the other NewTaskViewController (via delegate), but it's executed here.
    
    func didAddTask() {
        print("ta saindo aqui?")
        allTasksRecovered = TasksPersistence.getAllTasks()
        
    }
}



