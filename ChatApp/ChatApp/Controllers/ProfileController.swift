//
//  ViewController.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var transactions = [Transactions]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    fileprivate func setupViews() {
        transactions = TransactionsVM.getMyTransactions()
        tableView.register(UINib(nibName: String(describing: TransactionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TransactionCell.self))
        if let profileDetails = ProfileVM.getMyProfileDetails() {
            lblName.text = profileDetails.name
            lblEmail.text = profileDetails.emailId
            lblPhoneNumber.text = profileDetails.phoneNumber
        }
        self.navigationItem.title = "Profile"
    }
    
//    MARK: - TableView Delegates and DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionCell.self)) as! TransactionCell
        cell.transaction = transactions[indexPath.row]
        return cell
    }
}

