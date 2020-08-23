//
//  ViewController.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblWelcomeNote: UILabel!
    
    fileprivate var chatData = [String: [Chat]]()
    fileprivate var chatKeys = [String]()
    fileprivate var profileDetails: ProfileDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        chatData = ChatVM.getMyChats()
        sort()
        
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.register(UINib(nibName: String(describing: BotChatCell.self), bundle: nil), forCellReuseIdentifier: String(describing: BotChatCell.self))
        tableView.register(UINib(nibName: String(describing: UserChatCell.self), bundle: nil), forCellReuseIdentifier: String(describing: UserChatCell.self))
        
        profileDetails = ProfileVM.getMyProfileDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
    
//    MARK: - TableView Delegates and DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        if chatKeys.count == 0 {return 0}
        return chatKeys.count+1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lblWelcomeNote.isHidden = chatKeys.count != 0
        if section == chatKeys.count-1 { return (chatData[chatKeys[section]]?.count ?? 0)}
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = chatData[chatKeys[indexPath.section]]![indexPath.row]
        if chat.type == "bot" {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BotChatCell.self)) as! BotChatCell
            cell.chat = chat
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserChatCell.self)) as! UserChatCell
            cell.chat = chat
            cell.profileDetails = profileDetails
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == chatKeys.count-1 { return nil}
        let headerView = ChatHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.date = chatKeys[section-1]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == chatKeys.count-1 { return 0}
        return 40
    }

    @IBAction fileprivate func sendBtnhandler(_ sender: UIButton) {
        view.endEditing(true)
        
        guard profileDetails != nil else {return}
        guard let question = tfMessage.text else {return}
        tfMessage.text = ""
                
        let chat = Chat(profileDetails!.userId, timestamp: Int64(Date().timeIntervalSince1970), message: question, type: "self")
        addNewRow(chat)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(500)) {    
            let botResponse = ChatBotResponseVM.getResponse(by: question)
            let chat = Chat(self.profileDetails!.userId, timestamp: Int64(Date().timeIntervalSince1970), message: botResponse, type: "bot")
            self.addNewRow(chat)
        }
    }
    
    fileprivate func addNewRow(_ chat: Chat) {
        var chats = chatData[Date().getDate()] ?? []
        chats.insert(chat, at: 0)
        chatData[Date().getDate()] = chats
        RealmUtils.save(chat)
        sort()

        if tableView.numberOfSections != (chatData.count+1) && tableView.numberOfSections == 0 {
            tableView.reloadData()
        }else {
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.automatic)
        }
    }
    
    fileprivate func sort() {
        chatKeys = chatData.keys.sorted(by: { (d1, d2) -> Bool in
            return d1.compare(d1) == .orderedAscending
        })
    }
}

