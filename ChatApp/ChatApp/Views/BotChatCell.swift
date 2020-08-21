//
//  BotChatCell.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class BotChatCell: UITableViewCell {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var chat: Chat? {
        didSet {
            guard let chatMessage = chat else {return}
            lblMessage.text = chatMessage.message
        }
    }
    
}
