//
//  FirstLetterHeaderView.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 04.09.2021.
//

import UIKit

final class FirstLetterHeaderView: UITableViewHeaderFooterView {
//    MARK: - UI Elements
    private let firstLetterLabel = UILabel()
    
//    MARK: - Properties
    static let reuseIdentifier: String = "FirstLatterHeaderView"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureFirstLetterLabel()
        contentView.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Internal Methods
    internal func configureView(with letter: String) {
        firstLetterLabel.text = letter
    }
    
//    MARK: - Private Methods
    private func configureFirstLetterLabel() {
        firstLetterLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(firstLetterLabel)
        firstLetterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0.0).isActive = true
        firstLetterLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0).isActive = true
    }
}
