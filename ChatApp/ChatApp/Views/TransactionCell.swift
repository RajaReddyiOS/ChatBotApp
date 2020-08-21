//
//  TransactionCell.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.applyShadow(color: UIColor.lightGray, cornerRadius: 5)
    }
    
    var transaction: Transactions? {
        didSet {
            guard let transaction = transaction else {return}
            
            lblId.text = "ID: "+transaction.id
            lblAmount.text = "Amount: \(transaction.amount)"
            
            lblMonth.text = Date(timeIntervalSince1970: TimeInterval(transaction.time)).getMonth()
            lblDate.text = Date(timeIntervalSince1970: TimeInterval(transaction.time)).getDay()
        }
    }
    
}
