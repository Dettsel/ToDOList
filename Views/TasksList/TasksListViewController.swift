//
//  TasksViewViewController.swift
//  ToDoList
//
//  Created by Евгений Детцель on 15.11.2025.
//

import UIKit

protocol TasksListViewProtocol: AnyObject {
    func displayData(data: [TasksListViewController.Item])
}

final class TasksListViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let titleLabel = UILabel()
    private let searchController = UISearchController()
    private let headerContainer = UIView()

    private lazy var dataSourse = makeDataSource()

    // MARK: - Public Properties
    
    var presenter: TasksListPresenterProtocol?
    
    // MARK: - UIViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureTableView()
        configureTitleLabel()
        configureSearchController()
        configureHeaderContainer()

        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableHeaderView = headerContainer
        tableView.tableFooterView = UIView() //TODO: убрать нижний сепаратор

        presenter?.loadData()
    }

    private func setupSubviews() {
        view.addSubview(tableView)
        headerContainer.addSubview(titleLabel)
        headerContainer.addSubview(searchController.searchBar)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: headerContainer.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor),

            searchController.searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            searchController.searchBar.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor),
            searchController.searchBar.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
            searchController.searchBar.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor)
        ])
    }

    private func configureTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor(red: 77, green: 85, blue: 94, alpha: 1.0)

        tableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
    }

    private func configureTitleLabel() {
        titleLabel.text = "Задачи"
        titleLabel.font = .systemFont(ofSize: 34, weight: .bold)
        titleLabel.textColor = .white
    }

    private func configureHeaderContainer() {
        headerContainer.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 108)
    }

    private func configureSearchController() {
        searchController.searchBar.backgroundColor = .clear
        searchController.searchBar.placeholder = "Задачи"
        searchController.searchBar.searchBarStyle = .minimal
    }

}

extension TasksListViewController {
    typealias DataSource = UITableViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

    enum Section: Int, CaseIterable {
        case tasks
    }

    enum Item: Hashable {
        case task(TaskCell.ViewState)
    }

    private func makeDataSource() -> DataSource {
        DataSource(tableView: tableView) { tableView, index, item in
            switch item {
            case let .task(viewState):
                let cell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: index) as! TaskCell
                cell.backgroundColor = .clear
                cell.render(viewState)
                return cell
            }
        }
    }

}

// MARK: - TasksViewViewProtocol

extension TasksListViewController: TasksListViewProtocol {
    func displayData(data: [Item]) {
        var snapshot = Snapshot()
        snapshot.appendSections(Section.allCases)

        data.forEach { item in
            switch item {
            case .task:
                snapshot.appendItems([item], toSection: .tasks)
            }
        }

        DispatchQueue.main.async {
            self.dataSourse.apply(snapshot)
        }

    }
}
