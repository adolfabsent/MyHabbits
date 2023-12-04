//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Максим Зиновьев on 01.09.2023.
//

import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Все получится!"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(named: "SystemGrey2")
        return label
    }()

    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(Int(HabitsStore.shared.todayProgress*100))%"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor(named: "SystemGrey2")
        return label
    }()

    /// Progress Bar.
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progress = HabitsStore.shared.todayProgress
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.tintColor = UIColor(named: "Purple")
        return progressBar
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        self.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(percentageLabel)
        contentView.addSubview(progressBar)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    ///Function add constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),

            percentageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),

            progressBar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 38),
            progressBar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            progressBar.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            progressBar.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
        ])
    }

    /// Function settings Сollection View.
    func setup(){
        percentageLabel.text = "\(Int(HabitsStore.shared.todayProgress*100))%"
        progressBar.progress = HabitsStore.shared.todayProgress
    }

}
