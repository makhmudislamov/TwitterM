//
//  TwitterCell.swift
//  TwitterM
//
//  Created by Makhmud Sunnatovich on 2/15/16.
//  Copyright © 2016 makhmudislamov. All rights reserved.
//

import UIKit
import AFNetworking

class TwitterCell: UITableViewCell {
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var replyImageView: UIImageView!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet : Tweet! {
        didSet {
            mainTextLabel.text = tweet.text
            NameLabel.text = tweet.user?.name
            userNameLabel.text = "@\(tweet.user!.screenname)"
            
            retweetCountLabel.text = "\(tweet.retweetCount as! Int)"
            print("This set the retweet count: \(tweet.retweetCount as! Int)")
            
            favoriteCountLabel.text = "\(tweet.favoriteCount as! Int)"
            print("This is the set fav count: \(tweet.favoriteCount as! Int)")
            
            profileImageView.setImageWithURL(tweet.user!.profileImageUrl!)
            
            replyImageView.image = UIImage(named: "reply.png")
            
            retweetButton.setImage(UIImage(named: "retweet.png"), forState: UIControlState.Selected)
            
            favoriteButton.setImage(UIImage(named: "like.png"), forState: UIControlState.Selected)
            
            
            timeLabel.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
        }
    }
    
    //All credit for this method goes to David Wayman, slack @dwayman
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
        var rawTime = Int(timeTweetPostedAgo)
        var timeAgo: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        // Figure out time ago
        if (rawTime <= 60) { // SECONDS
            timeAgo = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) { // MINUTES
            timeAgo = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) { // HOURS
            timeAgo = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) { // DAYS
            timeAgo = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) { // YEARS
            timeAgo = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(timeAgo)\(timeChar)"
    }
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
