//
//  QuoteCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct QuoteCardView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    var isFavouriteQuote: Bool = false
    var quoteText: String = ""
    var author: String = ""
    var authorVisible: Bool = true
    var quoteID: String = ""
    
    // MARK: BODY -
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack {
                HStack {
                    let quoteContent =
                    Text("\" ")
                        .font(.custom(Constants.fontBlackItalic, size: 25))
                    + Text(quoteText)
                        .font(.custom(Constants.fontBold, size: 20))
                    
                    quoteContent
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: authorVisible ? 5 : 15, trailing: 15))
                    
                    Spacer()
                } //: HSTACK
                if authorVisible {
                    HStack {
                        Spacer()
                        Text("- \(author)")
                            .font(.custom(Constants.fontItalic, size: 17))
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
                    } //: HSTACK
                }
            } //: VSTACK
            Image("save-flag")
                .resizable()
                .frame(width: 40, height: 40)
                .opacity(isFavouriteQuote ? 1 : 0)
        } //: ZSTACK
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

// MARK: PREVIEW -

struct QuoteCardView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
//        QuoteCardView(quoteText: "This is test" , author: "Albert Einstien")
//            .previewLayout(.sizeThatFits)
    }
}
