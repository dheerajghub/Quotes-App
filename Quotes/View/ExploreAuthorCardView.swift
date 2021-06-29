//
//  ExploreAuthorCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct ExploreAuthorCardView: View {
    
    // MARK: PROPERTIES -
    
    var authorName: String
    var authorDescription: String
    var quoteCount: Int
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(authorName)
                    .font(.custom(Constants.fontBlack, size: 23))
                Text(authorDescription)
                    .font(.custom(Constants.fontItalic, size: 15))
                Text("Quote Count: \(quoteCount)")
                    .font(.custom(Constants.fontRegular, size: 13))
                    .foregroundColor(colorScheme == .dark ? .white.opacity(0.5) : .black.opacity(0.5))
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            Spacer()
            Image("forward")
                .resizable()
                .renderingMode(.template)
                .frame(width: 20, height: 20)
                .padding(.trailing, 15)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
    }
}

// MARK: PREIVIEW -

struct ExploreAuthorCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreAuthorCardView(authorName: "Albert Einstien", authorDescription: "This is a author description", quoteCount: 1244)
            .previewLayout(.sizeThatFits)
    }
}
