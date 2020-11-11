//
//  ViewControllerAudio.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import AVFoundation
import UIKit

class ViewControllerAudio: UIViewController {

    var player: AVAudioPlayer?
    
    @IBOutlet weak var EndButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EndButton.layer.cornerRadius = 25
    }

    
    @IBAction func playButton(_ sender: UIButton) {
        if let player = player, player.isPlaying{
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            player.stop()
        }
        else{
            
            let urlString = Bundle.main.path(forResource: "meditacion guiada 5 minutos", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
                
            } catch {
                print("Algo no esta bien")
            }
        }
    }
    
    
    @IBAction func heTerminadoButton(_ sender: UIButton) {
        
    }
    
    
}
