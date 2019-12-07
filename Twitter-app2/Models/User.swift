//
//  User.swift
//  Twitter-app2
//
//  Created by ahmed on 6/18/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
    var name: String
    var username: String
    var postText: String
    var profileImageUrl: String
    
    init(json: JSON){
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.postText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
