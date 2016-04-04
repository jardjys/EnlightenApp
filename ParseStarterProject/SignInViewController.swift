//
//  SignInViewController.swift
//  Enlighten
//
//  Created by Juan Andrés Rocha Díaz on 18/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    @IBOutlet weak var Signin: UIButton!
    @IBOutlet weak var Mail: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    @IBAction func Cancel(sender: AnyObject) {
        self.presentController("ThirdVC")
    }
    @IBAction func signInWasPressed(sender: AnyObject) {
        if Mail.text != "" && Password.text != "" {
            PFUser.logInWithUsernameInBackground(Mail.text!, password: Password.text!, block: { (user: PFUser?, error: NSError?) -> Void in
                if error == nil {
                    print("user logged in successfully")
                    self.presentController("Home")
                } else {
                    print(error)
                }
            })
        }

    }
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
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
