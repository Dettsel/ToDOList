//
//  TasksViewPresenter.swift
//  ToDoList
//
//  Created by Евгений Детцель on 15.11.2025.
//

import UIKit

protocol TasksListPresenterProtocol {
    init(view: TasksListViewProtocol, router: TasksListRouterProtocol)

    func loadData()
}

final class TasksViewPresenter {
    
    // MARK: - Private Properties
    
    private weak var view: TasksListViewProtocol?
    private let router: TasksListRouterProtocol

    private let taskData = [
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длинный текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "JOP3A", description: "jopajo3pa", date: "22/23/1111", isDone: true)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "JOP1A", description: "jopajo1pa", date: "22/14/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "JO4PA", description: "jopajo3pa", date: "22/56/1111", isDone: true)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длинный текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длинный текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длинный текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длиннфый текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длиннвый текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длинны й текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длиннцый текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Дликнный текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),
        TasksListViewController.Item.task(TaskCell.ViewState(title: "Длиенный текст задачи из одной строки", description: "Длинное описание возможно в две строки, но может быть и в одну", date: "22/11/1111", isDone: false)),

    ]

    // MARK: - Initializers
    
    init(view: TasksListViewProtocol, router: TasksListRouterProtocol) {
        self.view = view
        self.router = router
    }
}

extension TasksViewPresenter: TasksListPresenterProtocol {
    func loadData() {
        view?.displayData(data: taskData)
    }

}
