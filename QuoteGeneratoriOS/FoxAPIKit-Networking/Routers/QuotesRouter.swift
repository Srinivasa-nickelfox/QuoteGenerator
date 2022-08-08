//
//  QuotesRouter.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 08/08/22.
//

import Foundation
import FoxAPIKit

public enum QuotesRouter: BaseRouter {
    case fetchQuotes(_ params: [String:Any])
    public var method: HTTPMethod {
        switch self {
        case .fetchQuotes:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .fetchQuotes:
            return ""
        }
    }
    
    public var params: [String : Any] {
        switch self {
        case .fetchQuotes(let params):
            return params
        }
    }
    
    public var keypathToMap: String? {
        switch self {
        default:
            return nil
        }
    }
}
