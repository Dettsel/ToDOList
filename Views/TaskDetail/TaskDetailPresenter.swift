//
//  TaskDetailPresenter.swift
//  ToDoList
//
//  Created by Евгений Детцель on 18.11.2025.
//

import UIKit

protocol TaskDetailPresenterProtocol {
    init(view: TaskDetailViewProtocol, router: TaskDetailRouterProtocol)
}

final class TaskDetailPresenter: TaskDetailPresenterProtocol {
    
    // MARK: - Private Properties
    
    private weak var view: TaskDetailViewProtocol?
    private let router: TaskDetailRouterProtocol
    
    // MARK: - Initializers
    
    init(view: TaskDetailViewProtocol, router: TaskDetailRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}
