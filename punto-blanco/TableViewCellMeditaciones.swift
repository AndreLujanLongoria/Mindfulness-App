//
//  TableViewCellMeditaciones.swift
//  punto-blanco
//
//  Created by user180479 on 11/8/20.
//

import UIKit

class TableViewCellMeditaciones: UITableViewCell {

    static let identifier = "customCell"
    
    @IBOutlet weak var imgCustom: UIImageView!
    @IBOutlet weak var customCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customCell.clipsToBounds = true
        customCell.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCellMeditaciones", bundle: nil)
    }
    
    public func configure(with image: UIImage){
        imgCustom.image = image
    }
    
}
