//
//  TasksViewAssembly.swift
//  ToDoList
//
//  Created by Евгений Детцель on 15.11.2025.
//

import UIKit

final class TasksListAssembly {

    static func assembly() -> TasksListViewController {
        let view = TasksListViewController()
        let router = TasksListRouter(view: view)
        let presenter = TasksViewPresenter(view: view, router: router)
        view.presenter = presenter
        
        return view
    }
    
}
