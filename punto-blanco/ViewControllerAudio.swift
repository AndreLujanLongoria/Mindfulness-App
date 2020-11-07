//
//  ViewControllerAudio.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit



class ViewControllerAudio: UIViewController {

    
    var estadoPista = "Pause"
    @IBOutlet weak var btPlayPause: UIButton!
    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func fireTimer() {
        print("Se acabo el tiempo!")
    }
    
    @IBAction func playAudio(_ sender: UIButton) {
        if estadoPista == "Pause"{
            btPlayPause.setImage(UIImage(named: "pause-btn"), for: UIControl.State.normal)
            estadoPista = "Play"
        }else if estadoPista == "Play"{
            btPlayPause.setImage(UIImage(named: "play-btn"), for: UIControl.State.normal)
            estadoPista = "Pause"
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
