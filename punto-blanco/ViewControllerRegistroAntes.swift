//
//  ViewControllerRegistroAntes.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerRegistroAntes: UIViewController {

    @IBOutlet weak var lbBpm: UILabel!
    var bpm : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
