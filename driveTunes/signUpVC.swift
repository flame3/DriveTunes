//
//  signUpVC.swift
//  driveTunes
//
//  Created by nic on 10/3/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit

class signUpVC: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var reenterPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showLoginScreen(_ sender: Any) {
        print("Trying to show Login Screen")
        
    }
    
    
    @IBAction func performSignUp(_ sender: Any) {
        print("performing Sign Up")
    }
}
