//
//  TaskDetailRouter.swift
//  ToDoList
//
//  Created by Евгений Детцель on 18.11.2025.
//

import UIKit

protocol TaskDetailRouterProtocol {
    init(view: UIViewController)
}

final class TaskDetailRouter: TaskDetailRouterProtocol {
    
    // MARK: - Private Properties
    
    private weak var view: UIViewController?
    
    // MARK: - Initializers
    
    init(view: UIViewController) {
        self.view = view
    }
    
}
