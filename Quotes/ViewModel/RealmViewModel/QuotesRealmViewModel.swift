//
//  QuotesRealmViewModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import Foundation
import RealmSwift
import Combine

class QuoteRealmViewModel: ObservableObject {
    
    @Published var quotes: Results<QuotesDB>? = nil
    
    init(){
        let realm = try? Realm()
        if let quotes = realm?.objects(QuotesDB.self) {
            self.quotes = quotes
        }
    }
    
    /// It add quotes to the realmDB
    /// - Parameter data: it takes quote model for adding data to realmDB
    func addQuotes(_ data: Quote){
        /// Checking for existence of a quote: If exist delete otherwise add!
        if checkForQuoteExistence(with: data._id) {
            deleteQuote(with: data._id)
        } else {
            if let realm = quotes?.realm {
                try? realm.write {
                    let quote = QuotesDB()
                    quote.quoteId = data._id
                    quote.content = data.content
                    quote.author = data.author
                    quote.authorSlug = data.authorSlug
                    quote.tags = getStringFromArray(data.tags)
                    realm.add(quote)
                }
            }
        }
    }
    
    /// It Checks for quote Existence in the Realm DB
    /// - Parameter quoteId: Quote ID
    /// - Returns: it returns true for quote existence otherwise false
    func checkForQuoteExistence(with quoteId: String) -> Bool {
        let realm = try? Realm()
        if let quote = realm?.objects(QuotesDB.self).filter("quoteId == %@" , quoteId) {
            if quote.count > 0 {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    /// It deletes the quote with quoteId
    /// - Parameter quoteId: quote unique ID
    func deleteQuote(with quoteId: String) {
        let realm = try? Realm()
        if let quote = realm?.objects(QuotesDB.self).filter("quoteId == %@" , quoteId).first {
            try? realm?.write({
                realm?.delete(quote)
            })
        }
    }
    
    /// It converts Array of string into string using delemitter
    /// - Parameter tags: it takes array of strings
    /// - Returns: returns string
    func getStringFromArray(_ tags: [String]) -> String{
        var result = ""
        for tag in tags {
            result.append(contentsOf: "\(tag),")
        }
        /// removing last extra comma seperator (",") !
        result.removeLast()
        return result
    }
    
}
