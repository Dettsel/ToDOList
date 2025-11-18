//
//  TaskDetailViewController.swift
//  ToDoList
//
//  Created by Евгений Детцель on 18.11.2025.
//

import UIKit

protocol TaskDetailViewProtocol: AnyObject {
    func displayData(data: TaskDetailViewController.ViewState?)
}

final class TaskDetailViewController: UIViewController {

    struct ViewState {
        let title: String
        let date: String
        let description: String
    }

    private let titleTextField = UITextField()
    private let dateLabel = UILabel()
    private let descriptionTextField = UITextField()

    // MARK: - Public Properties

    var presenter: TaskDetailPresenterProtocol?
    
    // MARK: - UIViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupSubviews()
        configureTitleLable()
        configureDateLabel()
        configureDescriptionLabel()
    }

    private func setupSubviews() {
        view.addSubview(titleTextField)
        view.addSubview(dateLabel)
        view.addSubview(descriptionTextField)

        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),

            dateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),

            descriptionTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            descriptionTextField.leadingAnchor.constraint(equalTo: titleTextField.leadingAnchor),
            descriptionTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func configureTitleLable() {
        titleTextField.font = .systemFont(ofSize: 34, weight: .bold)
        titleTextField.textColor = .white
        titleTextField.textAlignment = .center
    }

    private func configureDateLabel() {
        dateLabel.font = .systemFont(ofSize: 16, weight: .regular)
        dateLabel.alpha = 0.5
    }

    private func configureDescriptionLabel() {
        descriptionTextField.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionTextField.textAlignment = .left
    }
}

// MARK: - TaskDetailViewProtocol

extension TaskDetailViewController: TaskDetailViewProtocol {
    func displayData(data: ViewState?) {
        guard let viewState = data else { return }

        titleTextField.text = viewState.title
        dateLabel.text = viewState.date
        descriptionTextField.text = viewState.description

    }
}

extension TaskDetailViewController {
}
