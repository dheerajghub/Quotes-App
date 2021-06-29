//
//  TagCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct TagCardView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    var tagName: String
    var quoteCount: Int
    
    // MARK: BODY -
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 0){
                Text(tagName.uppercased())
                    .font(.custom(Constants.fontBlack, size: 18))
                Text("Quote count: \(quoteCount)")
                    .font(.custom(Constants.fontBold, size: 15))
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.black.opacity(0.5))
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .frame(height: 100)
        .background(Constants.appSecondary)
        .cornerRadius(5)
    }
}

struct TagCardView_Previews: PreviewProvider {
    static var previews: some View {
        TagCardView(tagName: "technology", quoteCount: 1234)
            .previewLayout(.sizeThatFits)
    }
}
