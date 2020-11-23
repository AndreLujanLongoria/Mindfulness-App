//
//  TableViewCellMeditaciones.swift
//  punto-blanco
//
//  Created by user180479 on 11/8/20.
//

import UIKit

class TableViewCellMeditaciones: UITableViewCell {

    static let identifier = "customCell"
    
    
    @IBOutlet weak var viewButton: UIView!
    
    @IBOutlet weak var imgCustom: UIImageView!
    @IBOutlet weak var customCell: UIView!
    
    
    @IBOutlet weak var tituloText: UILabel!
    @IBOutlet weak var duracionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewButton.clipsToBounds = true
        viewButton.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCellMeditaciones", bundle: nil)
    }
    
    public func configureTitulo(with titulo: String){
        tituloText.text = titulo
    }
    
    public func configureDuracion(with duracion: String){
        duracionText.text = duracion
    }
    
}
