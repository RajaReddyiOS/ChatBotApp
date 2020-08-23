//
//  ChatHeaderView.swift
//  ChatApp
//
//  Created by Raja Reddy on 23/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import UIKit

class ChatHeaderView: UIView {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    fileprivate func setupViews()  {
        containerView = loadNib()
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(containerView)
        
        transform = CGAffineTransform(scaleX: 1, y: -1)
        
        lblDate.layer.cornerRadius = 10
        lblDate.layer.masksToBounds = true
    }
    
    var date: String? {
        didSet {
            guard let date = date else {return}
            lblDate.text = date
        }
    }
}
