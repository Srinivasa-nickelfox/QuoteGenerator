//
//  TableViewCell.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 03/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var quotation: UILabel!
    @IBOutlet var author: UILabel!
    
    var quote: Quote? = Quote(text: "", author: "")

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //self.quotation.text = quote?.text
        //self.author.text = quote?.author
        
    }
    
    func configure(with viewModel: QuoteViewModel) {
        quotation.text = viewModel.quote
        author.text = viewModel.author
    }
    
}
