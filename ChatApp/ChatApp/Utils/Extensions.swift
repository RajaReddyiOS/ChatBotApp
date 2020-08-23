//
//  Extensions.swift
//  ChatApp
//
//  Created by Raja Reddy on 18/08/20.
//  Copyright © 2020 Raja Reddy. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isBlank:Bool {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty
    }
}

extension UILabel {
    func highlight(searchedText: String?, color: UIColor = .green) {
        guard let txtLabel = self.text?.lowercased(), let searchedText = searchedText?.lowercased() else {
            return
        }
        let attributeTxt = NSMutableAttributedString(string: txtLabel.capitalized)
        let range: NSRange = attributeTxt.mutableString.range(of: searchedText, options: .caseInsensitive)
        attributeTxt.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedText = attributeTxt
    }
}

extension Date {
    static func generateRandomTimestamps(daysBack: Int = 15)-> Int64 {
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        let gregorian  = Calendar(identifier: Calendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -1 * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        return Int64((gregorian.date(byAdding: offsetComponents, to: Date()) ?? Date()).timeIntervalSince1970)
    }
    
    func getMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: self)
    }
    
    func getDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: self)
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
    
    func getTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}


extension UIView {
    
    public func applyShadow(shadowOffset: CGSize = CGSize.zero, opacity:Float=1.0, maskToBounds:Bool=false, shadowRadius:CGFloat=0.5, color :UIColor, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.clear) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = maskToBounds
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}
