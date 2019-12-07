//
//  Tweet.swift
//  Twitter-app2
//
//  Created by ahmed on 6/23/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    var user: User
    var messageTextView: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.messageTextView = json["message"].stringValue
    }
    
    
    
    
     static func messageAtrributor(name: String, userName: String, message:String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: name, attributes: [ .font : UIFont.boldSystemFont(ofSize: 16)])
        let usernameWithSpace = " \(userName)\n"
        attributedText.append(NSAttributedString(string: usernameWithSpace, attributes: [ .foregroundColor : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), .font : UIFont.systemFont(ofSize: 15) ]))
        // NSAttributedString.Key.foregroundColor
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute( .paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        // NSAttributedString.Key.paragraphStyle
        
        
        attributedText.append(NSAttributedString(string: message))
        return attributedText
    }
}
