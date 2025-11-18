//
//  TasksViewRouter.swift
//  ToDoList
//
//  Created by Евгений Детцель on 15.11.2025.
//

import UIKit

protocol TasksListRouterProtocol {
    init(view: UIViewController)
}

final class TasksListRouter: TasksListRouterProtocol {
    
    // MARK: - Private Properties
    
    private weak var view: UIViewController?
    
    // MARK: - Initializers
    
    init(view: UIViewController) {
        self.view = view
    }
    
}
