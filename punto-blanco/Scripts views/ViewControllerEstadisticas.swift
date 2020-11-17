//
//  ViewControllerEstadisticas.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerEstadisticas: UIViewController {

    var registro = [Usuario]()
    
    // Persistencia Codable
    func dataFileURL () -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("registro.plist")
        
        return pathArchivo
    }
    
    func obtenerRegistro() {
        registro.removeAll()
        do {
            let data = try Data.init(contentsOf: dataFileURL())
            registro = try PropertyListDecoder().decode([Usuario].self, from: data)
        } catch {
            print("Error al cargar los datos del archivo")
        }
    }
    
    
    @IBOutlet weak var bpmValue: UILabel!
    var bpm : Int = 0
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Estadisticas"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bpm = defaults.integer(forKey: "bpmBeforeMeditation")
        
        obtenerRegistro()
        
        let cantidad = registro.count
        var sum = 0
        
        for index in 0...cantidad-1 {
            sum += registro[index].pulsoDesp
        }
        let average = sum/cantidad
        
        bpmValue.text = String(average)
    }
}
