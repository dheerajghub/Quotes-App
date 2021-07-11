//
//  ImagesModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 07/07/21.
//

import Foundation

struct ImagesModel: Decodable, Identifiable {
    
    let id = UUID()
    var page: Int
    var per_page: Int
    var total_results: Int
    var photos: [PhotosModel]
    
    enum CodingKeys: String, CodingKey {
        case page, per_page , photos , total_results
    }
    
}

struct PhotosModel: Decodable, Identifiable {
    
    let id = UUID()
    let width: Int
    let height: Int
    let src: ImagesContentModel
    
    enum CodingKeys: String, CodingKey {
        case width , height , src
    }
    
}

struct ImagesContentModel: Decodable , Identifiable {

    let id = UUID()
    let original: String
    let medium: String
    let small: String
    
    enum CodingKeys: String, CodingKey {
        case original, medium, small
    }
        
}
