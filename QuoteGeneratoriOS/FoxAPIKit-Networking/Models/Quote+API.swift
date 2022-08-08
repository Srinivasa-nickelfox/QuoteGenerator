//
//  Article+API.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 08/08/22.
//

import Foundation
import FoxAPIKit
import ReactiveSwift

extension Quote {
    
    public static func fetch(params: [String:Any]) -> SignalProducer<[Quote], ModelError>{
        return SignalProducer.init { observer, lifetime in
            let router = QuotesRouter.fetchNews(params)
            QuotesAPIClient.shared.request(router) { (result :
                APIResult<ListResponse<Quote>>) in
                switch result {
                case .success(let value):
                    let quotes: [Quote] = value.list
                    print(quotes, "Quotes")
                    observer.send(value: quotes)
                    observer.sendCompleted()
                case .failure(let error):
                    observer.send(error: ModelError.custom(message: error.message))
                }
            }
        }
    }
}
