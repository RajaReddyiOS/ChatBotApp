//
//  ViewController.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var chatData = [Date: [Chat]]()
    fileprivate var chatKeys = [Date]()
    fileprivate var profileDetails: ProfileDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        chatData = ChatVM.getMyChats()
        chatKeys = chatData.keys.sorted(by: { (d1, d2) -> Bool in
            return d1.compare(d1) == .orderedAscending
        })
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        tableView.register(UINib(nibName: String(describing: BotChatCell.self), bundle: nil), forCellReuseIdentifier: String(describing: BotChatCell.self))
        tableView.register(UINib(nibName: String(describing: UserChatCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UserChatCell.self))
        profileDetails = ProfileVM.getMyProfileDetails()
    }

//    MARK: - TableView Delegates and DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1//chatKeys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100//(chatData[chatKeys[section]]?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BotChatCell.self)) as! BotChatCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)//CGAffineTransformMakeScale(1, -1);
            cell.lblMessage.text = "indexpath: \(String(describing: indexPath))"
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserChatCell.self)) as! UserChatCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.lblMessage.text = "indexpath: \(String(describing: indexPath))"
            cell.profileDetails = profileDetails
            return cell
        }
        
        let chat = chatData[chatKeys[indexPath.section]]![indexPath.row]
        if chat.type == "bot" {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BotChatCell.self)) as! BotChatCell
            cell.chat = chat
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserChatCell.self)) as! UserChatCell
            cell.chat = chat
            return cell
        }
    }

}

