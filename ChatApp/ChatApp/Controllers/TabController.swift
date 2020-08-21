//
//  ViewController.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    fileprivate func setupViews() {
        delegate = self
        self.navigationItem.title = "Chat"
    }
    
    @IBAction func logoutBtnHandler(_ sender: Any) {
        UserDefaultsHelper.save("", for: UserDefaultsHelper.Keys.loggedInEmail)
        let sb = UIStoryboard(name: "SignIn", bundle: nil)
        self.navigationController?.present(sb.instantiateInitialViewController()!, animated: false, completion: nil)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch selectedIndex {
        case 0:
            self.navigationItem.title = "Chat"
        case 1:
            self.navigationItem.title = "Filter"
        case 2:
            self.navigationItem.title = "Profile"
        default:
            break
        }
    }
}

