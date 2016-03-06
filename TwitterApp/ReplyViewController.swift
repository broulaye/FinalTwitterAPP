//
//  ReplyViewController.swift
//  TwitterApp
//
//  Created by Broulaye Doumbia on 3/5/16.
//  Copyright © 2016 Broulaye Doumbia. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var CharCount: UILabel!
    
    @IBOutlet weak var ProfileNameLabel: UILabel!
    
    @IBOutlet weak var TagLabel: UILabel!
    
    @IBOutlet weak var TextFieldView: UITextView!
    
    @IBOutlet weak var replyButton: UIButton!
    
    var user: User!
    var maxText: String!
    var reply_id: Int?
    var tweet: Tweet!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        reply_id = tweet.tweetID2
        ProfileImageView.layer.cornerRadius = 10.0
        ProfileImageView.clipsToBounds = true
        let imageUrl = tweet.user?.profileUrl
        ProfileImageView.setImageWithURL(NSURL(string: imageUrl!)!)
        ProfileNameLabel.text = tweet.user?.name
        TagLabel.text = "@\(tweet.user?.screenname)"
        
     
        CharCount.text = "\(140)"
        
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func endKeyboard(sender: AnyObject)
    {
        self.view.endEditing(true);
    }
    
    
    @IBAction func tweetPostAction(sender: AnyObject)
    {
        var post =  "?status=" + TextFieldView.text!.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        //?status=\(status)
        
        if(reply_id != nil)
        {
            post += "&in_reply_to_status_id=\(reply_id!)"
        }
        
        TwitterClient.sharedInstance.postTweet(post)
        
    }
    
    func textViewDidChange(textView: UITextView)
    {
        let characterCount = Int(textView.text.characters.count)
        
        CharCount.text = "\(140 - characterCount)"
        
        
        if(characterCount == 140)
        {
            maxText = textView.text;
        }
        
        if(characterCount > 140)
        {
            CharCount.text = "0"
            
            let alertController = UIAlertController(title: "Over 140 Characters", message: "Can't tweet more", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            textView.text = maxText;
            
            
        }
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
