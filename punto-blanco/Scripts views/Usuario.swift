//
//  Usuario.swift
//  punto-blanco
//
//  Created by user181032 on 11/17/20.
//

import UIKit

class Usuario: Codable {
    var pulsoAnt : Int
    var pulsoDesp : Int
    
    init (pulsoAnt : Int, pulsoDesp: Int){
        self.pulsoAnt = pulsoAnt
        self.pulsoDesp = pulsoDesp
    }

}
