//
//  ViewControllerHola.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerHola: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tvRetos: UITableView!
    
    
    let listaRetos = [
        Reto(NombreReto: "Empatia 5 minutos"),
        Reto(NombreReto: "Luz 10 minutos")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tvRetos.delegate = self
        self.tvRetos.dataSource = self
    }
    

    @IBAction func unwindEstad (unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindEventos (unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindMeditaciones (unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindHistorial (unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindPerfil (unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func unwindTerminado (unwindSegue: UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaRetos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaReto = tvRetos.dequeueReusableCell(withIdentifier: "celdaReto")!
        
        celdaReto.textLabel?.text = listaRetos[indexPath.row].NombreReto
        
        return celdaReto
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
