//
//  ViewControllerAceptarEvento.swift
//  punto-blanco
//
//  Created by user180479 on 11/11/20.
//

import UIKit

class ViewControllerAceptarEvento: UIViewController {

    
    @IBOutlet weak var asistireButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        asistireButton.layer.cornerRadius = 20
    }

    @IBAction func asistireButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
