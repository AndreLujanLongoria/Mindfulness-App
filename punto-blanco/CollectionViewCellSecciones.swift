//
//  CollectionViewCellSecciones.swift
//  punto-blanco
//
//  Created by user180479 on 11/5/20.
//

import UIKit

class CollectionViewCellSecciones: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbSeccion: UILabel!
    
    static let identifier = "CollectionViewCellSecciones"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage){
        imageView.image = image
    }
    
    public func configureLabel(with label: String){
        lbSeccion.text = label
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCellSecciones", bundle: nil)
    }

}
