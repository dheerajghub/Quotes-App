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
    
    @State var isCreatingQuote: String = ""
    @State var isFavouriteActionQuote: String = ""
    @State var cardOffset: CGSize = .zero
    @State var createViewScale: CGFloat = 0.0
    @State var createViewOpacity: Double = 0
    @State var creatingStateActive: Bool = false
    @State var favouriteStateActive:Bool = false
    @State var favouriteViewOpacity: Double = 0
    @State var favouriteViewScale: CGFloat = 0
    
    @State var showingCreatorView: Bool = false
    @State var quoteToSend: String = ""
    @State var quoteToSendAuthor: String = ""
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical , showsIndicators: false){
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if let quotes = realmModel.quotes! {
                    if quotes.count > 0 {
                        ForEach(realmModel.quotes!){ quote in
                            ZStack {
                                if isCreatingQuote == quote.quoteId {
                                    CreateActionView(creatingStateActive: $creatingStateActive, createViewScale: $createViewScale, createViewOpacity: $createViewOpacity)
                                }
                                
                                if isFavouriteActionQuote == quote.quoteId {
                                    FavoriteActionView(favouriteStateActive: $favouriteStateActive, favouriteViewOpacity: $favouriteViewOpacity, favouriteViewScale: $favouriteViewScale, isQuoteExist: realmModel.checkForQuoteExistence(with: quote.quoteId))
                                }
                                
                                QuoteCardView(isFavouriteQuote: false, quoteText: quote.content, author: quote.author, authorVisible: true , quoteID: quote.quoteId)
                                    .offset(CGSize(width: isCreatingQuote == quote.quoteId ? cardOffset.width : .zero , height: .zero))
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                if cardOffset.width >= 0 && cardOffset.width < 100 {
                                                    isCreatingQuote = quote.quoteId
                                                    cardOffset = gesture.translation
                                                    createViewOpacity = 1
                                                    createViewScale = (cardOffset.width / 100) > 1 ? 1 : (cardOffset.width / 100)
                                                    if cardOffset.width >= 95 {
                                                        creatingStateActive = true
                                                    } else {
                                                        creatingStateActive = false
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
                                                        quoteToSend = quote.content
                                                        quoteToSendAuthor = quote.author
                                                        showingCreatorView.toggle()
                                                    }
                                                    if cardOffset.width < -95 {
                                                        realmModel.addQuotes(Quote(tags: [""], _id: quote.quoteId, content: "", author: "", authorSlug: ""))
                                                    }
                                                    cardOffset = .zero
                                                    isFavouriteActionQuote = ""
                                                    isCreatingQuote = ""
                                                    favouriteViewOpacity = 0
                                                    createViewOpacity = 0
                                                    createViewScale = 0
                                                    favouriteViewScale = 0
                                                    creatingStateActive = false
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
        .fullScreenCover(isPresented: $showingCreatorView) {
            CreatorsView(quoteContent: quoteToSend, quoteAuthor: quoteToSendAuthor)
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
