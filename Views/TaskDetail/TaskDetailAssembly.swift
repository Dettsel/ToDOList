//
//  TaskDetailAssembly.swift
//  ToDoList
//
//  Created by Евгений Детцель on 18.11.2025.
//

import UIKit

final class TaskDetailAssembly {
    
    static func assembly() -> TaskDetailViewController {
        let view = TaskDetailViewController()
        let router = TaskDetailRouter(view: view)
        let presenter = TaskDetailPresenter(view: view, router: router)
        view.presenter = presenter
        
        return view
    }
    
}
