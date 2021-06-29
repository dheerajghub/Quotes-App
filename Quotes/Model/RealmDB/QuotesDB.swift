//
//  QuotesDB.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import RealmSwift
import Foundation

final class QuotesDB: Object, ObjectKeyIdentifiable {
    
    @objc dynamic var _id = ObjectId.generate()
    @objc dynamic var quoteId = ""
    @objc dynamic var tags = ""
    @objc dynamic var content = ""
    @objc dynamic var author = ""
    @objc dynamic var authorSlug = ""
    
    override static func primaryKey() -> String? {
        "_id"
    }
}
