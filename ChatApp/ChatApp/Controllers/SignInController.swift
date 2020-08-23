//
//  ViewController.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        self.navigationItem.title = "Log in"
    }
    
    @IBAction
    fileprivate func loginBtnHandler(_ sender: UIButton) {
        guard tfEmail.text != nil && tfPassword.text != nil else {return}
        
        if tfEmail.text!.isBlank {
            showAlert(message: "Email can not be blank")
        }else if tfPassword.text!.isBlank {
            showAlert(message: "Password can not be blank")
        }else if !tfEmail.text!.isValidEmail {
            showAlert(message: "Invalid Email id")
        }else {

            let profileDetails = ProfileVM.getProfileDetails(by: tfEmail.text!)
            if profileDetails != nil {
                if profileDetails!.password == tfPassword.text {
                    UserDefaultsHelper.save(tfEmail.text!, for: UserDefaultsHelper.Keys.loggedInEmail)
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    self.navigationController?.presentFullScreen(sb.instantiateInitialViewController()!)
                }else {
                    showAlert(message: "Invalid password")
                }
            }else {
                showAlert(message: "User Not Found. Do you want to SignUp?", okHandler: { (yesHandler) in
                    self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                }) { (cancelHandler) in }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let destVC = segue.destination as? SignUpController {
            destVC.emailId = tfEmail.text!
            destVC.password = tfPassword.text!
        }
    }
}

