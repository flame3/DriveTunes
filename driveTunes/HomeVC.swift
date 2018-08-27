//
//  HomeVC.swift
//  driveTunes
//
//  Created by nic on 31/1/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit



class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var library = MusicLibrary().library
    
    var obj = ["Are You Ready","To Go For A Ride", "With No Arguments", "About What Your Listening To"]
    let num = ["1","2","3","4"]
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 253/255, green: 211/255, blue: 17/255, alpha: 0)
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: customCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell as! customCell
        //cell.numberLabel.text = num[indexPath.row]
        cell.songTitleLabel.text = library[indexPath.row]["title"]
        
        
        return cell

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPlayer", sender: AnyObject.self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayer" {
            let playerVC = segue.destination as! nowPlayingVC
            //let  = nav.topViewController as! nowPlayingVC
            let indexPath = homeTableView.indexPathForSelectedRow!
            
            playerVC.trackID = indexPath.row
            
            
            
            
            
        }
    }

}
