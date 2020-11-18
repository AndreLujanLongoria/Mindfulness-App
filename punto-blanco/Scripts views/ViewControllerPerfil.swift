//
//  ViewControllerPerfil.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerPerfil: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    
    let defaults = UserDefaults.standard
    var activeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Perfil"
        logoutButton.layer.cornerRadius = 20
        
        //Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notificacion:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notificacion:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notificacion:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        tfNombre.text = defaults.string(forKey: "username")
        tfCorreo.text = defaults.string(forKey: "correoUsuario")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    /*
    //Solo probando que el teclado se acople al campo de texto
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    */
    
    @IBAction func quitaTeclado () {
        view.endEditing(true)
        defaults.set(tfNombre.text, forKey: "username")
        defaults.set(tfCorreo.text, forKey: "correoUsuario")
    }
    
    @objc func keyboardWillChange(notificacion:Notification){
        
        
        guard let keyboardRect = (notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        if notificacion.name == UIResponder.keyboardWillShowNotification ||
            notificacion.name == UIResponder.keyboardWillChangeFrameNotification{
            
            view.frame.origin.y = -keyboardRect.height/2
        }
        else
        {
            view.frame.origin.y = 0
        }
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
