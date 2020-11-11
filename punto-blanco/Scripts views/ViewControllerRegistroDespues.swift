//
//  ViewControllerRegistroDespues.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerRegistroDespues: UIViewController {

    
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var lbBpm: UILabel!
    let defaults = UserDefaults.standard
    var bpm : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Para terminar"
        endButton.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lessBpm(_ sender: UIButton) {
        bpm = Int(lbBpm.text!)
        bpm -= 1
        lbBpm.text = String(bpm)
    }
    
    @IBAction func moreBpm(_ sender: UIButton) {
        bpm = Int(lbBpm.text!)
        bpm += 1
        lbBpm.text = String(bpm)
    }
    
    //Adding UserDefaults
    @IBAction func bpmAfterMeditation(_ sender: UIButton) {
        defaults.set(bpm, forKey: "bpmAfterMeditation")
    }
}
