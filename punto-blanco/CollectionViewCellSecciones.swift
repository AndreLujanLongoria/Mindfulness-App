//
//  CollectionViewCellSecciones.swift
//  punto-blanco
//
//  Created by user180479 on 11/5/20.
//

import UIKit

class CollectionViewCellSecciones: UICollectionViewCell {

    @IBOutlet weak var buttonSection: UIButton!
    
    static let identifier = "CollectionViewCellSecciones"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonSection.clipsToBounds = true
        buttonSection.layer.masksToBounds = true
        buttonSection.layer.cornerRadius = 20
    }
    
    /*
    public func configure(with image: UIImage){
        imageView.image = image
    }
    */
    
    public func configure(with name: String){
        buttonSection.titleLabel?.text = name
    }
    
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCellSecciones", bundle: nil)
    }

}
