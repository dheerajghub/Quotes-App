//
//  QuotesViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import Foundation

class QuotesViewModel: ObservableObject {
    
    @Published var quoteModel: QuotesModel?
    @Published var isLoading: Bool = true
    
    func fetchQuote(for page: Int) {
        guard let url = URL(string: Constants.get_quote_url+"\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    if page == 1 {
                        self.quoteModel = quote
                        self.isLoading = false
                    } else {
                        self.isLoading = false
                        self.quoteModel?.page = quote.page
                        self.quoteModel?.results.append(contentsOf: quote.results)
                    }
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
    func fetchQuoteWithAuthorSlug(with slugname: String , for page: Int){
        guard let url = URL(string: Constants.get_quotes_for_author + slugname + "&page=\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    if page == 1 {
                        self.quoteModel = quote
                    } else {
                        self.quoteModel?.page = quote.page
                        self.quoteModel?.results.append(contentsOf: quote.results)
                    }
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
    func fetchQuoteWithTagName(with tagName: String , for page: Int) {
        guard let url = URL(string: Constants.get_quotes + "?tags=\(tagName)&page=" + "\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data = data else { return }
            do {
                let quote = try JSONDecoder().decode(QuotesModel.self, from: data)
                DispatchQueue.main.async {
                    if page == 1 {
                        self.quoteModel = quote
                        self.isLoading = false
                    } else {
                        self.isLoading = false
                        self.quoteModel?.page = quote.page
                        self.quoteModel?.results.append(contentsOf: quote.results)
                    }
                }
            } catch {
                print("Error description: \(error)")
            }
        }.resume()
    }
    
}

