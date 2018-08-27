//
//  loginRegisterController.swift
//  driveTunes
//
//  Created by nic on 29/6/2018.
//  Copyright © 2018 nicksdev. All rights reserved.
//

import UIKit

class loginRegisterController: UICollectionViewController {

    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "background")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.addSubview(backgroundImageView)
        
        
        setupBackgroundIV()
    }
    
    func setupBackgroundIV(){
        // need constraints for x, y, height, width
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }

}
