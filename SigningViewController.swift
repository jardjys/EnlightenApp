//
//  Signing.swift
//  Enlighten
//
//  Created by Juan Andrés Rocha Díaz on 17/03/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class SigningViewController: UIViewController {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var Login: UIButton!
    
    
    @IBAction func SignUpButton(sender: AnyObject) {
        print("Signup")
        self.presentController("SignUp")
    }
    @IBAction func LoginButton(sender: AnyObject) {
        print("Signin")
        self.presentController("SignIn")
    }
    
    
    func presentController(storyboardId: String) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier(storyboardId)
        self.presentViewController(controller!, animated: true, completion: nil)
    }

}
