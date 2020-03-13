//
//  ViewController.swift
//  musicApp
//
//  Created by Adam Jackrel on 2/28/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

//EXCELLENT DESIGN! VERY PLEASED YOU WENT THE EXTRA MILE TO FNID SOME NEW SOUND FILES. GREAT WORK -ADAM

import UIKit
 import AVFoundation

class ViewController: UIViewController {
   
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func MusicButton(_ sender: UIButton) {
        
    playSound(label: sender.currentTitle!)
    sender.alpha = 0.5
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        sender.alpha = 1.0
    }
    }
    
    func playSound(label :String) {
        guard let url = Bundle.main.url(forResource: label, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

           
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
     }
    



