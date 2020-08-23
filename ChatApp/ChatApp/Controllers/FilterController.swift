//
//  ViewController.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class FilterController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    fileprivate var companies = [Company]()
    fileprivate var filteredList = [Company]()
    fileprivate var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        companies = CompaniesVM.getCompanies()
        tableView.register(UINib(nibName: String(describing: SearchCompaniesCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SearchCompaniesCell.self))
        self.navigationItem.title = "Stock Companies"
    }
    
//    MARK: - TableView Delegates and DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchCompaniesCell.self)) as! SearchCompaniesCell
        cell.company = companies[indexPath.row]
        cell.searchQuery = searchBar.text
        return cell
    }

//    MARK: - Searchbar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(timerHandler(_:)), userInfo: searchText, repeats: false)
    }
    
    @objc
    fileprivate func timerHandler(_ sender: Timer) {
        tableView.reloadData()
    }
}

