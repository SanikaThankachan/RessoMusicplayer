//
//  MusicViewController.swift
//  Resso
//
//  Created by Zakkariya K.A on 02/11/22.
//

import UIKit
import AVFoundation

class MusicViewController: UIViewController {
    var songPlayer = AVAudioPlayer()
   var paused = false
   func songs(){
       guard let url = Bundle.main.url(forResource: song, withExtension: "mp3")
         else {
            return
         }
         do {
            songPlayer = try AVAudioPlayer(contentsOf: url)
            songPlayer.play()
         }
         catch {
         }
       
   }
   

    @IBOutlet weak var secondImageview: UIImageView!
    public var img = ""
    var label = ""
    var song = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        secondImageview.image =  UIImage(named: img)
        songs()
        
    }
    
    @IBAction func Playbutton(_ sender: Any) {
        songPlayer.play()
    }
    @IBAction func Rewindbutton(_ sender: Any) {
        if songPlayer.isPlaying || paused{
            songPlayer.stop()
            songPlayer.currentTime = 0
            songPlayer.play()
        }
        else{
            songPlayer.play()
        }
    }
    @IBAction func pause(_ sender: Any) {
        if songPlayer.isPlaying{
            songPlayer.pause()
            paused = true
        }
        else
        {
           
            paused = false
        }
    }
}
    
 
