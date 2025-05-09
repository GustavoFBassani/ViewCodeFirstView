//
//  categoryView.swift
//  ViewCodeFirstView
//
//  Created by Gustavo Ferreira bassani on 06/05/25.
//

import UIKit

class categoryView: UIView {
    
    lazy var iconImage: UIImageView = {
        
        let image = UIImageView()
        
        image.backgroundColor = .backTertiary
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "folderImage")
        image.contentMode = .scaleAspectFill
        
        
        return image
        
    }()
    
    lazy var categoryLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category"
        label.backgroundColor = .backTertiary
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .labPrimary
        
        return label
        
    }()
    
    //ordering tasks and maping to UIAction (necessary for button menu) and passing to selectedTask var
    private var taskSelection: [UIAction] {
        
        let orderedTasks = TaskEnum.allCases.sorted(by: {$0.rawValue < $1.rawValue})
        
        let tasksTransformedToUIAction = orderedTasks.map { taskType in
            UIAction(title: taskType.rawValue, image: UIImage(systemName: taskType.imageName)) { [weak self] action in self?.selectedTask = taskType}
            
        }
        
        return tasksTransformedToUIAction
        
    }
    
    //fetch selected task Enum and (used for the button title and used for save the the task in tableview)
    var selectedTask: TaskEnum? {
        didSet {
            
            selectButton.setTitle(selectedTask?.rawValue, for: .normal)
            
        }
    }
    
    lazy var selectButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.accent, for: .normal)
        button.backgroundColor = .backTertiary
        button.layer.cornerRadius = 12
        button.showsMenuAsPrimaryAction = true
        
        var config = UIButton.Configuration.plain()
        config.title = "Select"
        config.indicator = .popup
        button.configuration = config
        
        button.menu = UIMenu(title: "Task Type", options: [.singleSelection], children: taskSelection)
        
        return button
        
    }()
        
    
    //MARK: INITS
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension categoryView: ViewSetupProtocol {
    func addSubViews() {
        
        addSubview(iconImage)
        addSubview(categoryLabel)
        addSubview(selectButton)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 6.75),
            iconImage.widthAnchor.constraint(equalToConstant: 30),
            iconImage.heightAnchor.constraint(equalToConstant: 30),
            
            categoryLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 12),
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            categoryLabel.widthAnchor.constraint(equalToConstant: 200),
            
            selectButton.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 0),
            selectButton.topAnchor.constraint(equalTo: self.topAnchor),
            selectButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            selectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        self.backgroundColor = .backTertiary
        self.layer.cornerRadius = 12
    }
}
