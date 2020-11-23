//
//  ViewControllerAudio.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//


import UIKit
import AVFoundation

class ViewControllerAudio: UIViewController {

    var player: AVAudioPlayer?
  
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var EndButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        EndButton.layer.cornerRadius = 25
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Audio")

        
    }
    
    func playMusic(){
        let soundURL = Bundle.main.url(forResource: "mediacion guiada 5 minutos", withExtension: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print("Somethings wrong")
        }
        
        player?.play()
        playButton.setImage(UIImage(named:"pause"), for: .normal)
        slider.maximumValue = Float(player!.duration)
        //var Timere = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: "updateSlider", userInfo: nil, repeats: true)
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {

        if player?.isPlaying == true {
            player?.stop()
            playButton.setImage(UIImage(named:"play-btn"), for: .normal)
        } else {
            playMusic()
        }
    }
    
    @IBAction func changeAudioTime(_ sender: Any) {

        player?.stop()
        player?.currentTime = TimeInterval(slider.value)
        player?.prepareToPlay()
        player?.play()
    }
    
    func updateSlider(){
        slider.value = Float(player!.currentTime)
    }
    
    @IBAction func heTerminadoButton(_ sender: UIButton) {
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    
}
