//
//  SearchHeaderView.swift
//  2 Lesson 1
//
//  Created by Богдан Олещенко on 04.09.2021.
//

import UIKit

protocol SearchHeaderViewDelegate: AnyObject {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)

}

final class SearchHeaderView: UIView {

//    MARK: - UI Elements
  private let searchBar = UISearchBar()
    
//    MARK: - Properties
    weak var delegate: SearchHeaderViewDelegate?
    
    //    MARK: - Init(-s)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func configureSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        
        self.addSubview(searchBar)
        
        searchBar.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        searchBar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20.0).isActive = true
        searchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20.0).isActive = true
        
        searchBar.placeholder = "Search for friends..."
        
        searchBar.delegate = self
        
    }
}
// MARK: - UISearchBarDelegate
extension SearchHeaderView: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        delegate?.searchBarCancelButtonClicked(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchBar(searchBar, textDidChange: searchText)
    }
}
