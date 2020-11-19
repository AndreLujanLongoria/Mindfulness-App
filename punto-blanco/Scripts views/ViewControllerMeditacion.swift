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
        
        cvSecciones.register(CollectionViewCellSecciones.nib(), forCellWithReuseIdentifier: CollectionViewCellSecciones.identifier)
        tvMedit.register(TableViewCellMeditaciones.nib(), forCellReuseIdentifier: TableViewCellMeditaciones.identifier)

        self.tvMedit.delegate = self
        self.tvMedit.dataSource = self
        self.cvSecciones.delegate = self
        self.cvSecciones.dataSource = self
    }
}

extension ViewControllerMeditacion : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellSecciones.identifier, for: indexPath) as! CollectionViewCellSecciones
        
        item.configure(with: "Seccion")
        
        return item
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
     
     
     */
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

extension ViewControllerMeditacion : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaMeditaciones.count + 4
    }
    
    func tableView(_ tabliew: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tvMedit.dequeueReusableCell(withIdentifier: "customCell") as! TableViewCellMeditaciones
        celda.imgCustom.image = UIImage(named: "MujerNadando")
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addingBpmBefore", sender: self)
    }
}


