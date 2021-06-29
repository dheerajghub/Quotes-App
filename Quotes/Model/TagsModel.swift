//
//  TagsModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import Foundation

struct TagsModel: Decodable , Identifiable {
    
    let id = UUID()
    let _id: String
    let name: String
    let quoteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case _id, name , quoteCount
    }
    
}
