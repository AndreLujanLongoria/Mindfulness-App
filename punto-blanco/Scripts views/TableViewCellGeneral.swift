//
//  TableViewCellGeneral.swift
//  punto-blanco
//
//  Created by user180479 on 11/11/20.
//

import UIKit

class TableViewCellGeneral: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var view: UIView!
    
    static let identifier = "generalCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCellGeneral", bundle: nil)
    }
    
    public func configure(with text: String){
        lbTitle.text = text
    }
    
}
