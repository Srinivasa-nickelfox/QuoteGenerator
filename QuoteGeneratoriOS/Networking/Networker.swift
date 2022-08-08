//
//  Networker.swift
//  QuoteGenerator
//
//  Created by Midhun Kasibhatla on 29/07/22.
//

import Foundation
/*
enum NetworkError: Error {
    case badResponse
    case badStatusCode(Int)
    case badData
}

class Networker {
    
    static let shared = Networker()
    
    func getQuotes(completion: @escaping ([Quote]?, Error?) -> Void) {
        
        if let url = URL(string: "https://type.fit/api/quotes") {

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Not the right response!")
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badResponse)
                }
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("Error, status code", httpResponse.statusCode)
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badStatusCode(httpResponse.statusCode))
                }
                return
            }
            
            guard let data = data else {
                print("Bad data!")
                DispatchQueue.main.async {
                    completion(nil, NetworkError.badResponse)
                }
                return
            }

            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                print(quotes)
                print("Total \(quotes.count) quotes.")
                DispatchQueue.main.async {
                   completion(quotes, nil)
                    
                }
            } catch {
                print("Error", error)
            }
        }.resume()
            
        } else {
            fatalError()
        }
    }
}
*/
