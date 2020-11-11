//
//  ViewControllerSignUp.swift
//  punto-blanco
//
//  Created by user180479 on 11/11/20.
//

import UIKit

class ViewControllerSignUp: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign up"
        signupButton.layer.cornerRadius = 25
    }
    
    @IBAction func quitaTeclado () {
        view.endEditing(true)
    }

    @IBAction func signupButton(_ sender: UIButton) {
        if(tfUsername.text != "" && tfPassword.text != ""){
            registrarDatosDelUsuario()
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
