//
//  Evento.swift
//  punto-blanco
//
//  Created by user180508 on 11/5/20.
//

import UIKit

class Evento: NSObject {
    
    var Nombre : String
    var Foto : UIImage!
    
    init(Nombre: String, Foto: UIImage!) {
        self.Nombre = Nombre
        self.Foto = Foto
    }

}
