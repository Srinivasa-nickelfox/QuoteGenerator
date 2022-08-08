//
//  Article.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 08/08/22.
//

import Foundation
import JSONParsing

final public class Quote {
    public var text: String
    public var author: String?

    init(text: String, author: String?) {
        self.text = text
        self.author = author
    }
}

extension Quote: JSONParseable {
    
    public static func parse(_ json: JSON) throws -> Quote {
        return try Quote(text: json["text"]^, author: json["author"]^?)
    }
}

extension Date: JSONParseTransformable {
    public typealias RawValue = String
    
    public static func transform(_ value: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ddEEEEEHH:mm:ssZ"
        return formatter.date(from: value)
    }
}
