//
//  nowPlayingVC.swift
//  driveTunes
//
//  Created by nic on 31/1/2017.
//  Copyright © 2017 nicksdev. All rights reserved.
//

import UIKit
import AVFoundation


class nowPlayingVC: UIViewController {
    @IBOutlet weak var coverArtIV: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistTitleLabel: UILabel!
    @IBOutlet weak var songProgressBar: UIProgressView!

    
    var trackID: Int = 0
    var audioPlayer: AVAudioPlayer!
    
    var library = MusicLibrary().library
    
    
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // I'd like to create a dictionary of the song title, the artist and the cover image.
        // After doing that have this loop through and fill the dictionary up
//        for song in songs{
//           // songs.append()
//        }
        
        if let coverImage = library[trackID]["coverImage"]{
            coverArtIV.image = UIImage(named: "\(coverImage).jpg")
        }
        songTitleLabel.text = library[trackID]["title"]
        artistTitleLabel.text = library[trackID]["artist"]
        
        // this is the problem once I can get this line to work the way it should I'll be good.
        // it won't find the right path thereby leaving audio player nil
        let path = Bundle.main.path(forResource: "\(trackID)", ofType: "mp3")
        
        if let path = path{
            let myURL = NSURL(fileURLWithPath: path)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: myURL as URL)
                audioPlayer.play()
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nowPlayingVC.updateProgressBar), userInfo: nil, repeats: true)
                songProgressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                
            }catch let error as NSError {
                print(error.localizedDescription)
                
            }
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    @objc func updateProgressBar() {
        
        if audioPlayer.isPlaying{
            songProgressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
        }
    }

    
    
    @IBAction func prevButton(_ sender: Any) {
        if trackID != 0 || trackID > 0 {
            trackID -= 1
            if let coverImage = library[trackID]["coverImage"]{
                coverArtIV.image = UIImage(named: "\(coverImage).jpg")
            }
            songTitleLabel.text = library[trackID]["title"]
            artistTitleLabel.text = library[trackID]["artist"]
            
            let path = Bundle.main.path(forResource: "\(trackID)", ofType: "mp3")
            
            if let path = path{
                let myURL = NSURL(fileURLWithPath: path)
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: myURL as URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nowPlayingVC.updateProgressBar), userInfo: nil, repeats: true)
                    songProgressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                    
                }catch let error as NSError {
                    print(error.localizedDescription)
                    
                }
            }
        }
        audioPlayer.currentTime = 0
        songProgressBar.progress = 0
        
       

    }

    @IBAction func playpauseButton(_ sender: Any) {
      
        if audioPlayer != nil {
            if !audioPlayer.isPlaying {
                audioPlayer.play()
            } else{
                audioPlayer.stop()
                //if i wanted to truly make it stop and restart
                //audioPlayer.currentTime = 0
                 print("AYE: I'm trying!")
            }
        }else{
            print("AYE: audioPlayer is nil")
        }
    
        
    
    }
    
    @IBAction func skipButton(_ sender: Any) {
        //library.count for some reason returns out of the range when you get the last song when you hit next
        
        if trackID == 0 || trackID < 4 {
            trackID += 1
            if let coverImage = library[trackID]["coverImage"]{
                coverArtIV.image = UIImage(named: "\(coverImage).jpg")
            }
            songTitleLabel.text = library[trackID]["title"]
            artistTitleLabel.text = library[trackID]["artist"]
            
            let path = Bundle.main.path(forResource: "\(trackID)", ofType: "mp3")
            
            if let path = path{
                let myURL = NSURL(fileURLWithPath: path)
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: myURL as URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nowPlayingVC.updateProgressBar), userInfo: nil, repeats: true)
                    songProgressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                    
                }catch let error as NSError {
                    print(error.localizedDescription)
                    
                }
            }
        }
        audioPlayer.currentTime = 0
        songProgressBar.progress = 0
        
        

    }
}
