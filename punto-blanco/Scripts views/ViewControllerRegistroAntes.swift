//
//  ViewControllerRegistroAntes.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerRegistroAntes: UIViewController {

    @IBOutlet weak var buttonComenzemos: UIButton!
    @IBOutlet weak var lbBpm: UILabel!
    let defaults = UserDefaults.standard
    var bpm : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Antes de comenzar"
        buttonComenzemos.layer.cornerRadius = 25
        
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

    @IBAction func bpmBeforeMeditation(_ sender: UIButton) {
        defaults.setValue(bpm, forKey: "bpmBeforeMeditation")
    }
}
