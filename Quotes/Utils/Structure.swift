//
//  Structure.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct ActionViewData: Identifiable {
    let id = UUID()
    let type: String
    let image: UIImage!
    let text: String!
    let color: Color!
    let title: String!
    let toggleView: String!
}

struct CategoryData: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}
