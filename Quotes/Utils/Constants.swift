//
//  Constants.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import Foundation
import SwiftUI

struct Constants {
    
    /// Custom Colors
    static let appSecondary = Color.gray.opacity(0.1)
    static let appPrimary = Color.black.opacity(0.9)
    static let appGreen = Color(red: 0, green: 217/255, blue: 25/255)
    static let appBlue = Color(red: 49/255, green: 172/255, blue: 247/255)
    
    ///  API urls
    static let base_url = "https://api.quotable.io"
    static let get_quote_url = "\(base_url)/quotes?page="
    static let get_tags_url = "\(base_url)/tags"
    static let get_authors_url = "\(base_url)/authors"
    static let get_author_with_slugname = "\(base_url)/authors?slug="
    static let get_randon_quote_url = "\(base_url)/random"
    static let get_quotes = "\(base_url)/quotes"
    static let get_quotes_for_author = "\(base_url)/quotes?author="
    
    /// Custom Font names
    static let fontRegular = "PlayfairDisplay-Regular"
    static let fontItalic = "PlayfairDisplay-Italic"
    static let fontBold = "PlayfairDisplay-Bold"
    static let fontBoldItalic = "PlayfairDisplay-BoldItalic"
    static let fontBlack = "PlayfairDisplay-Black"
    static let fontBlackItalic = "PlayfairDisplay-BlackItalic"
    static let fontGothamLight = "Gotham-Light"
    static let fontGaramondRoman = "Garamond-Roman"
    static let fontVollkornItalic = "Vollkorn-Italic"
    static let fontFreightSansBook = "Freight-SansBook"
    static let fontMontserratRegular = "Montserrat-Regular"
    static let fontDancingScriptRegular = "DancingScript-Regular"
    static let fontOpenSansRegular  = "OpenSans-Regular"
    static let fontTimesNewRoman = "TimesNewRomanPSMT"
    
}
