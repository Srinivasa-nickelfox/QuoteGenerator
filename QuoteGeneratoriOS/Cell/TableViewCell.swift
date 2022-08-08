//
//  TableViewCell.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 03/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var qoute: UILabel!
    @IBOutlet var author: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
