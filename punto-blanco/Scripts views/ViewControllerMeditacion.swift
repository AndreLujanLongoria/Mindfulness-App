//
//  ViewControllerMeditacion.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerMeditacion: UIViewController {
    
    @IBOutlet weak var tvMedit: UITableView!
    @IBOutlet weak var cvSecciones: UICollectionView!
    
    var ListaMeditaciones = [
           Meditaciones(Nombre: "Empatía", foto: UIImage(named: "empatia")),
           Meditaciones(Nombre: "Luz", foto: UIImage(named: "luz"))
    ]
    
    /*
     ---Nombre de variables----
     tvMedit = table view meditaciones
     cvSecciones = collective view secciones
     */

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Meditaciones"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
 
        tvMedit.register(TableViewCellMeditaciones.nib(), forCellReuseIdentifier: TableViewCellMeditaciones.identifier)

        self.tvMedit.delegate = self
        self.tvMedit.dataSource = self
    }
}

extension ViewControllerMeditacion : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaMeditaciones.count + 4
    }
    
    func tableView(_ tabliew: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tvMedit.dequeueReusableCell(withIdentifier: "customCell") as! TableViewCellMeditaciones
        //celda.imgCustom.image = UIImage(named: "")
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addingBpmBefore", sender: self)
        self.tvMedit.deselectRow(at: indexPath, animated: false)
    }
    
}


