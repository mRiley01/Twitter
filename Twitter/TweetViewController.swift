//
//  TweetViewController.swift
//  Twitter
//
//  Created by CSUDH on 3/15/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var tweetTextView: UITextView!
   
  
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: { self.dismiss(animated: true, completion: nil) }, failure: { (error) in
                print("Error posting tweet \(error)")
                print(error.localizedDescription)
                self.dismiss(animated: true, completion: nil)
            })
        }
     else {
        self.dismiss(animated: true, completion: nil)
     }
    }
    
   
}
