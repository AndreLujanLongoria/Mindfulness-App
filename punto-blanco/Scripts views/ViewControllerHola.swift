//
//  ViewControllerHola.swift
//  punto-blanco
//
//  Created by user181032 on 11/3/20.
//

import UIKit

class ViewControllerHola: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imgPuntoBlanco: UIImageView!
    @IBOutlet weak var tvRetos: UITableView!
    
    
    let listaRetos = [
        Reto(NombreReto: "Empatia 5 minutos"),
        Reto(NombreReto: "Luz 10 minutos")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hola"
        imgPuntoBlanco.layer.cornerRadius = 30
        
        self.tvRetos.delegate = self
        self.tvRetos.dataSource = self
        
        tvRetos.register(TableViewCellGeneral.nib(), forCellReuseIdentifier: TableViewCellGeneral.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaRetos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaReto = tvRetos.dequeueReusableCell(withIdentifier: TableViewCellGeneral.identifier) as! TableViewCellGeneral
        
        celdaReto.configure(with: listaRetos[indexPath.row].NombreReto)
        
        return celdaReto
    }
    

}
