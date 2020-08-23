//
//  SearchCompaniesCell.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class SearchCompaniesCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var searchQuery: String? {
        didSet {
            guard let searchQuery = searchQuery else { return }
            lblName.highlight(searchedText: searchQuery)
        }
    }
    
    var company: Company? {
        didSet {
            guard let name = company?.name else {return}
            lblName.text = name
        }
    }
}
