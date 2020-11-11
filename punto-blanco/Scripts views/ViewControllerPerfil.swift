//
//  ViewControllerPerfil.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerPerfil: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Perfil"
        logoutButton.layer.cornerRadius = 20
    }
    
    @IBAction func quitaTeclado () {
        view.endEditing(true)
    }
    
    @IBAction func logoutFromSession(_ sender: UIButton) {
        // ...
            // after user has successfully logged out
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
        
        resetDefaults()
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    
}
