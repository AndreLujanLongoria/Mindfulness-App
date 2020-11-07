//
//  ViewControllerMeditacion.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerMeditacion: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var tvMedit: UITableView!
    

    @IBOutlet weak var cvSecciones: UICollectionView!
    
    var ListaMeditaciones = [
        Meditaciones(Nombre: "Empatía", foto: UIImage(named: "empatia")),
        Meditaciones(Nombre: "Luz", foto: UIImage(named: "luz"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        cvSecciones.register(CollectionViewCellSecciones.nib(), forCellWithReuseIdentifier: CollectionViewCellSecciones.identifier)

        self.tvMedit.delegate = self
        self.tvMedit.dataSource = self
        self.cvSecciones.delegate = self
        self.cvSecciones.dataSource = self
    }
    
    @IBAction func unwindRegistro (unwindSegue: UIStoryboardSegue){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaMeditaciones.count
    }
    
    func tableView(_ tabliew: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tvMedit.dequeueReusableCell(withIdentifier: "celda")!
        celda.textLabel?.text = ListaMeditaciones[indexPath.row].Nombre
        celda.imageView?.image = ListaMeditaciones[indexPath.row].foto
        
        return celda
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellSecciones.identifier, for: indexPath) as! CollectionViewCellSecciones
        
        item.configure(with: UIImage(named: "meditarItem")!)
        item.configureLabel(with: "Seccion")
        
        return item
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

extension ViewControllerMeditacion:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
