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
    func getQuotes(completion: @escaping ([Quote]?, Error?) -> Void) {
        let url = URL(string: "https://type.fit/api/quotes")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            
           /* guard error == nil, let data = data else {
                print(error!)
                return
            }
            print(data)
           */
            
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

            //print(String(data: data!, encoding: .utf8)!)
            //let quotes = try JSONDecoder().decode(QouteSerialize.self, from: data)
            /*
            do {
                if let quotes = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: String?]] {
                    let arrayOfQuotes = quotes.compactMap(Quote.init)
                    print(arrayOfQuotes)
                    print(".................................................................................................")
                    print("Total \(arrayOfQuotes.count) quotes.")
                    print(".................................................................................................")
                    let quote = arrayOfQuotes.randomElement()
                    print("\(quote?.text ?? "May God bless you!") - \(quote?.author ?? "Anonymous")")
                }
            } catch {
                print(error)
            }
        }.resume()
             */
            do {
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                print(quotes)
                print("Total \(quotes.count) quotes.")
                DispatchQueue.main.async {
                    
                  /*
                   let quote = quotes.randomElement()
                   self.label.text = quote?.text
                   self.authorName.text = quote?.author ?? "Anonymous"
                  */
                   completion(quotes, nil)
                    
                }
            } catch {
                print("Error", error)
            }
        }.resume()
    }
}
 */
