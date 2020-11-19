//
//  ViewControllerEstadisticas.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerEstadisticas: UIViewController {

    @IBOutlet weak var progUno: UIProgressView!
    @IBOutlet weak var progDos: UIProgressView!
    @IBOutlet weak var progTres: UIProgressView!
    @IBOutlet weak var progCuatro: UIProgressView!
    @IBOutlet weak var progCinco: UIProgressView!
    @IBOutlet weak var progSeis: UIProgressView!
    @IBOutlet weak var ProgSiete: UIProgressView!
    let compUno = Progress(totalUnitCount: 200)
    let compDos = Progress(totalUnitCount: 200)
    let compTres = Progress(totalUnitCount: 200)
    let compCuatro = Progress(totalUnitCount: 200)
    let compCinco = Progress(totalUnitCount: 200)
    let compSeis = Progress(totalUnitCount: 200)
    let compSiete = Progress(totalUnitCount: 200)
    
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
        
        if cantidad > 0 {
            for index in 0...cantidad-1 {
                sum += registro[index].pulsoDesp
            }
            let average = sum/cantidad
            
            bpmValue.text = String(average)
        } else {
            bpmValue.text = String("0")
        }
        
        compUno.completedUnitCount = 0
        compDos.completedUnitCount = 0
        compTres.completedUnitCount = 0
        compCuatro.completedUnitCount = 0
        compCinco.completedUnitCount = 0
        compSeis.completedUnitCount = 0
        compSiete.completedUnitCount = 0
        
        for index in 0...cantidad-1 {
            if index == 0 {
                compUno.completedUnitCount = Int64(registro[index].pulsoDesp)
            } else if index == 1 {
                compDos.completedUnitCount = Int64(registro[index].pulsoDesp)
            } else if index == 2 {
                compTres.completedUnitCount = Int64(registro[index].pulsoDesp)
            } else if index == 3 {
                compCuatro.completedUnitCount = Int64(registro[index].pulsoDesp)
            } else if index == 4 {
                compCinco.completedUnitCount = Int64(registro[index].pulsoDesp)
            } else if index == 5 {
                compSeis.completedUnitCount = Int64(registro[index].pulsoDesp)
            } else if index == 7 {
                compSiete.completedUnitCount = Int64(registro[index].pulsoDesp)
            }
        }
        
        var aux = Float(compUno.fractionCompleted)
        progUno.setProgress(aux, animated: true)
        aux = Float(compDos.fractionCompleted)
        progDos.setProgress(aux, animated: true)
        aux = Float(compTres.fractionCompleted)
        progTres.setProgress(aux, animated: true)
        aux = Float(compCuatro.fractionCompleted)
        progCuatro.setProgress(aux, animated: true)
        aux = Float(compCinco.fractionCompleted)
        progCinco.setProgress(aux, animated: true)
        aux = Float(compSeis.fractionCompleted)
        progSeis.setProgress(aux, animated: true)
        aux = Float(compSiete.fractionCompleted)
        ProgSiete.setProgress(aux, animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
