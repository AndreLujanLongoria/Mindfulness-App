//
//  ViewControllerEventos.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerEventos: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tvEventos: UITableView!
    
    let listaEventos = [
        Evento(Nombre: "Evento1", Foto: UIImage(named: "empatia")),
        Evento(Nombre: "Evento2", Foto: UIImage(named: "luz"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Eventos"
        
        self.tvEventos.delegate = self
        self.tvEventos.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaEventos = tvEventos.dequeueReusableCell(withIdentifier: "celdaEventos")!
        celdaEventos.textLabel?.text = listaEventos[indexPath.row].Nombre
        celdaEventos.imageView?.image = listaEventos[indexPath.row].Foto
        
        return celdaEventos
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
