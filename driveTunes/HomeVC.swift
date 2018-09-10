//
//  HomeVC.swift
//  driveTunes
//
//  Created by nic on 31/1/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit



class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var playlist = MusicLibrary().playlist
    var library = MusicLibrary().library
    
    
    var obj = ["Are You Ready","To Go For A Ride", "With No Arguments", "About What Your Listening To"]
    let num = ["1","2","3","4"]
    
    @IBOutlet weak var sharedPlaylistCV: UICollectionView!
    @IBOutlet weak var songTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor(red: 253/255, green: 211/255, blue: 17/255, alpha: 0)
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        sharedPlaylistCV.delegate = self
        songTableView.delegate = self
        sharedPlaylistCV.dataSource = self
        songTableView.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlist.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        as! customCVCell
        
        cell.playlistTitleLBL.text = playlist[indexPath.row]["title"]
        cell.coverArtIV.image = UIImage(named: playlist[indexPath.row]["coverImage"]!)
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTVCell
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
            let indexPath = songTableView.indexPathForSelectedRow!
            
            playerVC.trackID = indexPath.row
            
            
            
            
            
        }
    }

}
