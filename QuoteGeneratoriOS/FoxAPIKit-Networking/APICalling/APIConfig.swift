//
//  APIConfig.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 08/08/22.
//

import Foundation

public struct APIConfig {
    
    public struct APIUrl {
        #if DEBUG
        static let domain = APIUrl.dev
        #elseif DEV1
        static let domain = APIUrl.qa
        #elseif STAGING
        static let domain = APIUrl.staging
        #elseif RELEASE
        static let domain = APIUrl.prod
        #endif
        
        private static let dev = "https://type.fit/api/quotes"
        private static let qa = "https://type.fit/api/quotes"
        private static let staging = "https://type.fit/api/quotes"
        private static let prod = "https://type.fit/api/quotes"
    }

}
