//
//  ViewControllerMeditationReview.swift
//  punto-blanco
//
//  Created by user180479 on 11/11/20.
//

import UIKit

class ViewControllerMeditationReview: UIViewController {

    
    @IBOutlet weak var calificarButton: UIButton!
    @IBOutlet weak var terminarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Felicidades"
        calificarButton.layer.cornerRadius = 30
        terminarButton.layer.cornerRadius = 30
    }
    
    @IBAction func bpmAfterButton(_ sender: UIButton) {
        
        /*
        let meditationView = self.storyboard?.instantiateViewController(identifier: "meditationView") as! ViewControllerMeditacion
        
        self.present(meditationView, animated: true, completion: nil)
        */
        
        //self.navigationController?.viewControllers = [self]
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
}
