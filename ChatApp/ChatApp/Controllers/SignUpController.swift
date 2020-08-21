//
//  SignUpController.swift
//  ChatApp
//
//  Created by Raja Reddy on 20/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    var emailId = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        tfEmail.text = emailId
        tfPassword.text = password
        self.navigationItem.title = "Sign up"
    }
   
    @IBAction
    fileprivate func signUpBtnHandler(_ sender: UIButton) {
        
        guard tfEmail.text != nil && tfPassword.text != nil && tfPhoneNumber.text != nil && tfName.text != nil else { return }
        
        if tfEmail.text!.isBlank {
            showAlert(message: "Email can not be blank")
        }else if tfPassword.text!.isBlank {
            showAlert(message: "Password can not be blank")
        }else if tfName.text!.isBlank {
            showAlert(message: "Name can not be blank")
        }else if tfPhoneNumber.text!.isBlank {
            showAlert(message: "Phone Number can not be blank")
        }else if !tfEmail.text!.isValidEmail {
            showAlert(message: "Invalid email")
        }else if tfPassword.text!.count < 6 {
            showAlert(message: "Password should be at least 6 charaters")
        }else {
            
            let alert = showProgressAlert("Creating User ...")
            let userId = "\(ProfileVM.getAll().count+1)"
            RealmUtils.save(ProfileDetails(tfEmail.text!, password: tfPassword.text!, phoneNumber: tfPhoneNumber.text!, name: tfName.text!, userId: userId))
            DataUploader.writeCompaniesData {
                DataUploader.writeTransactionsData(userId) {
                    DispatchQueue.main.async {
                        alert.dismiss(animated: true) {
                            self.navigationController?.popViewController(animated: false)
                        }
                    }
                }
            }
        }
    }
}
