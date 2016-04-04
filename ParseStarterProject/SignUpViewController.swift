//
//  SignUpViewController.swift
//  Enlighten
//
//  Created by Juan Andrés Rocha Díaz on 17/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    @IBAction func Cancel(sender: AnyObject) {
        self.presentController("ThirdVC")
    }
    @IBAction func SignUpWasPressed(sender: AnyObject) {
        
        if EmailText.text != "" && PasswordText.text != "" {
            let user = PFUser()
            user.username = self.EmailText.text
            user.email = self.EmailText.text
            user.password = self.PasswordText.text
            
            user.signUpInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if success {
                    print("User signed up successfully")
                    self.presentController("Home")
                } else {
                    print(error)
                }
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
