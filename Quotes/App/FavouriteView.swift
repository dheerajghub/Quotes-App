//
//  FavouriteView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI
import MobileCoreServices

struct FavouriteView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var realmModel = QuoteRealmViewModel()
    private var gridItemLayout = [GridItem(.flexible())]
    
    @State var isCopiedQuote: String = ""
    @State var isFavouriteActionQuote: String = ""
    @State var cardOffset: CGSize = .zero
    @State var copyViewScale: CGFloat = 0.0
    @State var copyViewOpacity: Double = 0
    @State var copiedStateActive: Bool = false
    @State var favouriteStateActive:Bool = false
    @State var favouriteViewOpacity: Double = 0
    @State var favouriteViewScale: CGFloat = 0
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false){
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if let quotes = realmModel.quotes! {
                    if quotes.count > 0 {
                        ForEach(realmModel.quotes!){ quote in
                            ZStack {
                                if isCopiedQuote == quote.quoteId {
                                    CopyActionView(copiedStateActive: $copiedStateActive, copyViewScale: $copyViewScale, copyViewOpacity: $copyViewOpacity)
                                }
                                
                                if isFavouriteActionQuote == quote.quoteId {
                                    FavoriteActionView(favouriteStateActive: $favouriteStateActive, favouriteViewOpacity: $favouriteViewOpacity, favouriteViewScale: $favouriteViewScale, isQuoteExist: realmModel.checkForQuoteExistence(with: quote.quoteId))
                                }
                                
                                QuoteCardView(isFavouriteQuote: false, quoteText: quote.content, author: quote.author, authorVisible: true , quoteID: quote.quoteId)
                                    .offset(CGSize(width: isCopiedQuote == quote.quoteId ? cardOffset.width : .zero , height: .zero))
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                if cardOffset.width >= 0 && cardOffset.width < 100 {
                                                    isCopiedQuote = quote.quoteId
                                                    cardOffset = gesture.translation
                                                    copyViewOpacity = 1
                                                    copyViewScale = (cardOffset.width / 100) > 1 ? 1 : (cardOffset.width / 100)
                                                    if cardOffset.width >= 95 {
                                                        copiedStateActive = true
                                                    } else {
                                                        copiedStateActive = false
                                                    }
                                                }
                                                if cardOffset.width > -100 && cardOffset.width < 0 {
                                                    isFavouriteActionQuote = quote.quoteId
                                                    cardOffset = gesture.translation
                                                    favouriteViewOpacity = 1
                                                    favouriteViewScale = CGFloat((abs(cardOffset.width) / 100) > 1 ? 1 : (abs(cardOffset.width) / 100))
                                                    if cardOffset.width <= -95 {
                                                        favouriteStateActive = true
                                                    } else {
                                                        favouriteStateActive = false
                                                    }
                                                }
                                            }
                                            .onEnded { _ in
                                                withAnimation(Animation.spring()) {
                                                    if cardOffset.width > 95 {
                                                        UIPasteboard.general.setValue(quote.content, forPasteboardType: kUTTypePlainText as String)
                                                    }
                                                    if cardOffset.width < -95 {
                                                        realmModel.addQuotes(Quote(tags: [""], _id: quote.quoteId, content: "", author: "", authorSlug: ""))
                                                    }
                                                    cardOffset = .zero
                                                    isFavouriteActionQuote = ""
                                                    isCopiedQuote = ""
                                                    favouriteViewOpacity = 0
                                                    copyViewOpacity = 0
                                                    copyViewScale = 0
                                                    favouriteViewScale = 0
                                                    copiedStateActive = false
                                                    favouriteStateActive = false
                                                }
                                            }
                                    )
                            } //: ZSTACK
                        }
                    } else {
                        DefaultView(title: "Nothing on favorite list")
                    }
                }
                
            } //: LAZYVGRID
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        } //: SCROLLVIEW
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
