//
//  HomeView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI
import MobileCoreServices

struct HomeView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var quotesVM = QuotesViewModel()
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
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: Constants.fontBlack, size: 20)!]
        self.quotesVM.fetchQuote(for: 1)
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if quotesVM.isLoading {
                    ProgressView()
                        .padding(.top , 100)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    if let quotes = quotesVM.quoteModel?.results {
                        ForEach(quotes) { quote in
                            NavigationLink(destination: QuoteDetailView(data: quote)) {
                                ZStack {
                                    if isCopiedQuote == quote._id {
                                        CopyActionView(copiedStateActive: $copiedStateActive, copyViewScale: $copyViewScale, copyViewOpacity: $copyViewOpacity)
                                    }
                                    
                                    if isFavouriteActionQuote == quote._id {
                                        FavoriteActionView(favouriteStateActive: $favouriteStateActive, favouriteViewOpacity: $favouriteViewOpacity, favouriteViewScale: $favouriteViewScale, isQuoteExist: realmModel.checkForQuoteExistence(with: quote._id))
                                    }
                                    
                                    QuoteCardView(isFavouriteQuote: realmModel.checkForQuoteExistence(with: quote._id) , quoteText: quote.content , author: quote.author , quoteID: quote._id)
                                        .offset(CGSize(width: isCopiedQuote == quote._id ? cardOffset.width : .zero , height: .zero))
                                        .gesture(
                                            DragGesture()
                                                .onChanged { gesture in
                                                    if cardOffset.width >= 0 && cardOffset.width < 100 {
                                                        isCopiedQuote = quote._id
                                                        cardOffset = gesture.translation
                                                        copyViewOpacity = 1
                                                        copyViewScale = (cardOffset.width / 100) > 1 ? 1 : (cardOffset.width / 100)
                                                        if cardOffset.width >= 95 {
                                                            copiedStateActive = true
                                                        } else {
                                                            copiedStateActive = false
                                                        }
                                                    }
                                                    if cardOffset.width > -100 && cardOffset.width <= 0 {
                                                        isFavouriteActionQuote = quote._id
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
                                                            realmModel.addQuotes(quote)
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
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        if let quoteTotalCount = quotesVM.quoteModel?.totalCount {
                            if quoteTotalCount > quotes.count {
                                ProgressView()
                                    .padding()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .onAppear(perform: {
                                        if let page = quotesVM.quoteModel?.page {
                                            self.quotesVM.fetchQuote(for: page + 1)
                                        }
                                    })
                            }
                        }
                    }
                }
            } //: LAZYVGRID
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        } //: SCROLLVIEW
    }
}

// MARK: PREVIEW -

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
