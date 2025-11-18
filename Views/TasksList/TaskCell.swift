//
//  TaskCell.swift
//  ToDoList
//
//  Created by Евгений Детцель on 15.11.2025.
//

import UIKit

class TaskCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let dateLabel = UILabel()
    private let checkmarkImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = .clear
        setupSubviews()
        configureTitleLabel()
        configureDescriptionLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(checkmarkImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateLabel)

        checkmarkImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            checkmarkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            checkmarkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            checkmarkImage.widthAnchor.constraint(equalToConstant: 24),
            checkmarkImage.heightAnchor.constraint(equalToConstant: 24),

            titleLabel.leadingAnchor.constraint(equalTo: checkmarkImage.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -6),

            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -6),

            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    private func configureTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .white
    }

    private func configureDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = .white
    }

    private func configureDateLabel() {
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        dateLabel.numberOfLines = 1
        dateLabel.textColor = .white
        dateLabel.alpha = 0.5
    }
}

extension TaskCell {
    struct ViewState: Hashable {
        let title: String
        let description: String
        let date: String
        var isDone: Bool
    }

    public func render(_ viewState: ViewState) {
        checkmarkImage.image = viewState.isDone ? UIImage(named: "check") : UIImage(named: "circle")

        titleLabel.alpha = viewState.isDone ? 0.5 : 1.0
        if viewState.isDone {
            titleLabel.attributedText = NSAttributedString(
                string: viewState.title,
                attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue]
            )
        } else {
            titleLabel.text = viewState.title
        }

        descriptionLabel.text = viewState.description
        descriptionLabel.alpha = viewState.isDone ? 0.5 : 1.0

        dateLabel.text = viewState.date
    }
}
