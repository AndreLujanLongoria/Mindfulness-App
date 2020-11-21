//
//  ViewControllerRegistroDespues.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerRegistroDespues: UIViewController {

    
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var lbBpm: UILabel!
    let defaults = UserDefaults.standard
    var bpm : Int!
    var registro = [Usuario]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Para terminar"
        endButton.layer.cornerRadius = 25
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bpm = 80
        obtenerRegistro()
    }
    
    @IBAction func lessBpm(_ sender: UIButton) {
        bpm = Int(lbBpm.text!)
        bpm -= 1
        lbBpm.text = String(bpm)
    }
    
    @IBAction func moreBpm(_ sender: UIButton) {
        bpm = Int(lbBpm.text!)
        bpm += 1
        lbBpm.text = String(bpm)
    }
    
    // Persistencia Codable
    func dataFileURL () -> URL {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let pathArchivo = url.appendingPathComponent("registro.plist")
        
        return pathArchivo
    }
    
    @IBAction func guardarRegistro() {
        do {
            let data = try PropertyListEncoder().encode(registro)
            try data.write(to: dataFileURL())
        }
        catch {
            print("Error al guardar el registro")
        }
    }
    
    func obtenerRegistro() {
        registro.removeAll()
        do {
            let data = try Data.init(contentsOf: dataFileURL())
            registro = try PropertyListDecoder().decode([Usuario].self, from: data)
        } catch {
            print("Error al cargar los datos")
        }
    }
    
    //Adding UserDefaults
    @IBAction func bpmAfterMeditation(_ sender: UIButton) {
        defaults.set(bpm, forKey: "bpmAfterMeditation")
        
        let ant = defaults.integer(forKey: "bpmBeforeMeditation")
        let desp = defaults.integer(forKey: "bpmAfterMeditation")
        
        let aux = Usuario(pulsoAnt: ant, pulsoDesp: desp)
        registro.append(aux)
        
        if registro.count == 8 {
            registro.remove(at: 0)
        }
        guardarRegistro()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

    
}
