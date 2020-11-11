//
//  ViewControllerRegistroDespues.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerRegistroDespues: UIViewController {

    
    @IBOutlet weak var endButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Para terminar"
        endButton.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
}
