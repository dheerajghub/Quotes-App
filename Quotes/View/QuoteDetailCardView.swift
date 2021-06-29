//
//  QuoteDetailCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct QuoteDetailCardView: View {
    
    // MARK: PROPERTIES -
    
    var quoteData: Quote
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            let quoteContent =
            Text("\" ")
                .font(.custom(Constants.fontBlackItalic, size: 30))
            + Text(quoteData.content)
                .font(.custom(Constants.fontBold, size: 25))
            
            quoteContent
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            
            Spacer()
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

// MARK: PREVIEW -

struct QuoteDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailCardView(quoteData: Quote(tags: ["wisdom"], _id: "", content: "Wisdom is a kind of knowledge. It is knowledge of the nature, career, and consequences of human values.", author: "Helmut Sigmund", authorSlug: ""))
            .previewLayout(.sizeThatFits)
    }
}
