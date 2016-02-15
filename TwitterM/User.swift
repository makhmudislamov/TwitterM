//
//  User.swift
//  TwitterM
//
//  Created by Makhmud Sunnatovich on 2/14/16.
//  Copyright © 2016 makhmudislamov. All rights reserved.
//

import UIKit

var _currentUser: User?
let curentUserKey = "kCurrentUserKey"

class User: NSObject {
    var name: String?
    var screenname: String?
    var profileImageUrl: String?
    var tagline: String?
    var dictionary: NSDictionary

    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagline = dictionary["description"] as? String
    }
    
    class var currentUser: User? {
        get {
            return _currentUser
        }
        set(user) {
              _currentUser = user
            
            if _currentUser != nil {
                var data = NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: nil, error: nil)
                
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: curentUserKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
        
    }
}
