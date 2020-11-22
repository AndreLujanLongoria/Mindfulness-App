//
//  ViewControllerHistorial.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerHistorial: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tablaMedit: UITableView!
    var registro = [Usuario]()
    var cantidad : Int!
    
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
            cantidad = registro.count
        } catch {
            print("No hay datos aun")
            cantidad = 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minicelda")!
        cell.textLabel?.text = "Pulsos: " + String(registro[indexPath.row].pulsoAnt) + " -> " + String(registro[indexPath.row].pulsoDesp)
        
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Historial"
        // Do any additional setup after loading the view.
        tablaMedit.delegate = self
        tablaMedit.dataSource = self
        obtenerRegistro()
        tablaMedit.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        obtenerRegistro()
        tablaMedit.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
