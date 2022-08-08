//
//  ViewController.swift
//  QuoteGeneratoriOS
//
//  Created by Midhun Kasibhatla on 03/08/22.
//

import UIKit
import ReactiveSwift

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var quotesDisplay = [Quote]()
    var viewModels = [QuoteViewModel]()
    var disposable = CompositeDisposable([])
    
    var viewModel = QuoteViewModel(quote: "", author: "")
    
    var limit = 2
    var totalQuotes = 0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        self.setupObservers()
        self.getQuotes()
    }
    
    private func getQuotes() {
        let params: [String:Any] = [:]
        self.fetchQuotesAction.apply(params).start()

    }
    
    private let fetchQuotesAction = Action { (params: [String:Any]) -> SignalProducer<[Quote], ModelError> in
        return Quote.fetch(params: params)
    }
    
    private func setupObservers() {
        self.disposable += self.fetchQuotesAction.values.observeValues(
            { [weak self] (quotes) in

                self?.quotesDisplay = quotes
//                if let quotes = quotes {
//                   //self.quotesDisplay = quotes
//                    totalQuotes = quotes.count
//                    while index < limit {
//                        self.quotesDisplay.append(quotes[index])
//                        index += 1
//                      }
//                }
                self?.viewModels = quotes.map({QuoteViewModel(quote: $0.text, author: $0.author ?? "Anonymous")})
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                })
        self.disposable += self.fetchQuotesAction.errors.observeValues({(error) in
            print(error)
        })
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.configure(with: viewModels[indexPath.row])
            //cell.quote = quotesDisplay[indexPath.row]
            return cell
        } else {
            fatalError()
        }
    }
    
    /*
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == quotesDisplay.count - 1 {
            var index = quotesDisplay.count - 1
            if index + 2 > totalQuotes - 1 {
                limit = viewModels.count - index
            } else {
                limit = index + 2
            }
            while index < limit {
                quotesDisplay.append(quotesDisplay[index])
                index += 1
            }
            self.perform(#selector(loadTable), with: nil, afterDelay: 4)
        }
    }
    
    @objc func loadTable() {
        self.tableView.reloadData()
    }
    */
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 820
    }
}

