//
//  ExploreAuthorListView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct ExploreAuthorListView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var authorVM = AuthorsViewModel()
    private var gridItemLayout = [GridItem(.flexible())]
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
    
    init() {
        self.authorVM.fetchAuthors(for: 1)
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if authorVM.isLoading {
                    ProgressView()
                        .padding(.top , 100)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    if let authors = authorVM.authorsModel?.results {
                        ForEach(authors) { author in
                            NavigationLink(destination: AuthorQuoteListView(authorSlug: author.slug , authorName: author.name , totalQuotes: author.quoteCount , fromExplore: true)) {
                                ExploreAuthorCardView(authorName: author.name, authorDescription: author.description, quoteCount: author.quoteCount)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        if let authorTotalCount = authorVM.authorsModel?.totalCount {
                            if authorTotalCount > authors.count {
                                ProgressView()
                                    .padding()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .onAppear(perform: {
                                        if let page = authorVM.authorsModel?.page {
                                            self.authorVM.fetchAuthors(for: page + 1)
                                        }
                                    })
                            }
                        }
                    }
                }
            } //: LAZYVGRID
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        } //: SCROLLVIEW
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationBarTitle(Text("Explore Authors"))
    }
}

// MARK: - PREVIEW

struct ExploreAuthorListView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreAuthorListView()
    }
}
