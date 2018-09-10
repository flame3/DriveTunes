//
//  loginVC.swift
//  driveTunes
//
//  Created by nic on 10/3/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var backgroundIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func showSignUpScreen(_ sender: Any) {
        print("trying to show Sign up screen")
    }
    
    @IBAction func performLogin(_ sender: Any) {
        print("performing Login")

    }
    
}
