//
//  UserChatCell.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class UserChatCell: UITableViewCell {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        transform = CGAffineTransform(scaleX: 1, y: -1)
    }

    var chat: Chat? {
        didSet {
            guard let chatMessage = chat else {return}
            lblMessage.text = chatMessage.message
            lblTime.text = Date(timeIntervalSince1970: TimeInterval(chatMessage.timestamp)).getTime()
        }
    }
    
    var profileDetails: ProfileDetails? {
        didSet {
            guard let profileDetails = profileDetails else {return}
            lblName.text = profileDetails.name
        }
    }
}
