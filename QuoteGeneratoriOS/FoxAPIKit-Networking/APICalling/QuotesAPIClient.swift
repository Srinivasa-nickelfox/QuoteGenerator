//
//  APIClient.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 08/08/22.
//

import Foundation
import FoxAPIKit

public typealias APICompletion<T> = (APIResult<T>) -> Void

class QuotesAPIClient: APIClient<AuthHeaders, ErrorResponse> {
    
    static let shared = QuotesAPIClient()
    
    override init() {
        super.init()
        #if DEBUG
        enableLogs = true
        #else
        enableLogs = false
        #endif
    }
    
    override func authenticationHeaders(response: HTTPURLResponse) -> AuthHeaders? {
        return nil
    }
}
