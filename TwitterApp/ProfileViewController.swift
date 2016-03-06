//
//  ProfileViewController.swift
//  TwitterApp
//
//  Created by macbookair11 on 2/28/16.
//  Copyright © 2016 Broulaye Doumbia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var followingCount: UILabel!
    
    @IBOutlet weak var followerCount: UILabel!
    
    @IBOutlet weak var likesCount: UILabel!
    
    var tweet: Tweet!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = tweet.user?.profileUrl
        profileImageView.setImageWithURL(NSURL(string: imageUrl!)!)
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.clipsToBounds = true
        let bannerUrl = tweet.user?.bannerUrl
        if let backgroundStringUrl = tweet.user?.bannerUrl
        {
            var backgroundUrl = NSURL(string: backgroundStringUrl)
            BackgroundImage.setImageWithURL(NSURL(string: bannerUrl!)!)
        }
        else
        {
            let defaultImage = UIImage(named: "Twitter_Logo")
            BackgroundImage.image = defaultImage
        }
        
        nameLabel.text = tweet.user?.name
        tagLabel.text = "@\(tweet.user?.screenname)"
        followerCount.text = displayNumber((tweet.user?.numFollowers)!)
        followingCount.text = displayNumber((tweet.user?.numFollowing)!)
        likesCount.text = displayNumber((tweet.user?.numTweets)!)
        descriptionLabel.text = tweet.user?.userDescription
        // Do any additional setup after loading the view.
    }

    func displayNumber(var num: Int) -> String{
        if(num >= 1000000) {
            num = num/1000000
            return "\(num)M"
        }
        else if(tweet.retweetCount >= 1000) {
            num = num/1000
            return "\(num)K"
        } else {
            return "\(num)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
