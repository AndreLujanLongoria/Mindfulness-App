//
//  ViewController.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
    }

    @IBAction func quitaTeclado () {
        view.endEditing(true)
        registrarDatosDelUsuario()
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        // ...
        // after login is done, maybe put this in the login web service completion block
        if(tfUsername.text != "" && tfPassword.text != ""){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        }
        else{
            return
        }
    }
    
    private func registrarDatosDelUsuario(){
        
        guard tfUsername.text != "" else{
            return
        }
        guard tfPassword.text != "" else {
            return
        }
        
        let defaults = UserDefaults.standard
        let name = tfUsername.text
        defaults.set(name, forKey: "username")
        let password = tfPassword.text
        defaults.set(password, forKey: "password")
        
    }

}

