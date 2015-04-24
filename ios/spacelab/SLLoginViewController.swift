//
//  SLLoginViewController.swift
//  spacelab
//
//  Created by Shawn Roske on 3/24/15.
//  Copyright (c) 2015 space150. All rights reserved.
//

import UIKit

class SLLoginViewController: UIViewController
{
    @IBOutlet weak var movieContainerView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    private var playerViewController : VideoPlayerViewController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5.0
        loginButton.clipsToBounds = true
        
        // add the video for the face animation
        playerViewController = VideoPlayerViewController()
        playerViewController.playOnLoad = true
        playerViewController.loopPlayback = true
        playerViewController.URL = NSBundle.mainBundle().URLForResource("startup-movie.mp4", withExtension: nil)
        playerViewController.view.frame = movieContainerView.frame
        movieContainerView.addSubview(playerViewController.view)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doLogin(sender: AnyObject)
    {
        var signIn = GPPSignIn.sharedInstance()!
        signIn.authenticate()
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