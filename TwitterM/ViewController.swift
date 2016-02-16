//
//  ViewController.swift
//  TwitterM
//
//  Created by Makhmud Sunnatovich on 2/14/16.
//  Copyright © 2016 makhmudislamov. All rights reserved.
//

import UIKit
import BDBOAuth1Manager


class ViewController: UIViewController {
    
   
    
    @IBOutlet var InitialView: UIView!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonClick(sender: AnyObject) {
        
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if user != nil {
//                self.performSegueWithIdentifier("loginSegue", sender: self)
                self.appDelegate.setupTabBars()
            } else {
                //handle login error
            }
        }
        
      
    }
    
}

