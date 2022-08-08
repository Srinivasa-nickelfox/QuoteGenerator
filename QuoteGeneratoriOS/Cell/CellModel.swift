//
//  CellModel.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 03/08/22.
//

import Foundation

class QuoteViewModel {
    
    var quote : String
    var author : String?
    
    init(quote: String, author: String?) {
        self.quote = quote
        self.author = author
    }
}

class QuoteViewModel1 {
    
    var quote : String
    
    
    init(quote: String) {
        self.quote = quote
        
    }
}
