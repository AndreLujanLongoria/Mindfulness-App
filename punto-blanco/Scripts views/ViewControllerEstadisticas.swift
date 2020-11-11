//
//  ViewControllerEstadisticas.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerEstadisticas: UIViewController {

    
    @IBOutlet weak var bpmValue: UILabel!
    var bpm : Int = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Estadisticas"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bpm = defaults.integer(forKey: "bpmBeforeMeditation")
        bpmValue.text = String(bpm)
    }
}
