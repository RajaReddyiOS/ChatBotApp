//
//  ViewControllerExtension.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(_ title: String = "Alert", message: String, okHandler: ((UIAlertAction) -> Void)? = nil, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: okHandler))
        if cancelHandler != nil {
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: cancelHandler))
        }
        (self.navigationController ?? self).present(alert, animated: true, completion: nil)
    }
    
    func showProgressAlert(_ title: String = "Loading ...") -> UIAlertController {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.startAnimating()

        alert.view.addSubview(activityIndicator)
        alert.view.heightAnchor.constraint(equalToConstant: 95).isActive = true

        activityIndicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -20).isActive = true

        (self.navigationController ?? self).present(alert, animated: true)
        return alert
    }
    
    func presentFullScreen(_ destinationVC: UIViewController, animated: Bool = false, completion: (() -> Void)? = nil) {
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: animated, completion: completion)
    }
}


