//
//  ViewControllerMeditacion.swift
//  punto-blanco
//
//  Created by user181032 on 11/4/20.
//

import UIKit

class ViewControllerMeditacion: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tvMedit: UITableView!
    
    var ListaMeditaciones = [
        Meditaciones(Nombre: "Empatía", foto: UIImage(named: "empatia")),
        Meditaciones(Nombre: "Luz", foto: UIImage(named: "luz"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tvMedit.delegate = self
        self.tvMedit.dataSource = self
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
