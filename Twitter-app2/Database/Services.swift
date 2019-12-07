//
//  UserData.swift
//  Twitter-app2
//
//  Created by ahmed on 6/18/19.
//  Copyright © 2019 ahmed. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

// Generics an array extention
extension Collection where Iterator.Element == JSON{
    func decode<T: JSONDecodable>() throws -> [T]{
        return try map{try T(json: $0)}
    }
}



class Services{
    
    static let shared = Services()
    var UserList: [User]!
    var tweetList: [Tweet]!

    class Home: JSONDecodable{
        var Users:[User]
        var Tweets:[Tweet]
        required init(json: JSON) throws {
            guard let jsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
                throw NSError(domain: "Parsing_Error" , code: 1, userInfo: nil)
            }
//            self.Users = jsonArray.map{User(json: $0)}
//            self.Tweets = tweetsJsonArray.map{Tweet(json: $0)}
     
            self.Users = try jsonArray.decode()
            self.Tweets = try tweetsJsonArray.decode()
            
            }
        }
    

    class JSONError: JSONDecodable{
        required init(json: JSON) throws {
            print("Error")
        }
    }
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    func fetchHomFeed(compilition: @escaping (Error?) -> ()){
        let request: APIRequest<Home, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { (home) in
        self.UserList = home.Users
        self.tweetList = home.Tweets
        compilition(nil)
            
        }) { (err) in
            print("faild to fetch!")
            compilition(err)
        }
    }
    
}
