//
//  Tweet.swift
//  TwitterM
//
//  Created by Makhmud Sunnatovich on 2/14/16.
//  Copyright © 2016 makhmudislamov. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var id: NSNumber?
    var favoriteCount: NSNumber?
    var retweetCount: NSNumber?
    var retweetImage: UIImage?
    var favImage: UIImage?


    init(dictionary: NSDictionary) {
     
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        id = dictionary["id"] as? Int
        
        favoriteCount = dictionary["favorite_count"] as! Int
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        
        retweetImage = nil
        favImage = nil
        
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    }
    class func tweetAsDictionary(dict: NSDictionary) -> Tweet {
        
        // print(dict)
        
        let tweet = Tweet(dictionary: dict)
        
        return tweet
    }
    
    
}
