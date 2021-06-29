//
//  AuthorDetailView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct AuthorDetailView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var authorsVM = AuthorsViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    
    var authorSlug: String
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
    
    init(authorSlug: String){
        self.authorSlug = authorSlug
        authorsVM.fetchAuthorWithSlug(with: authorSlug)
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                if authorsVM.isLoading {
                    ProgressView()
                        .padding(.top , 100)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    if let authorData = authorsVM.authorsModel?.results {
                        AuthorInfoView(authorData: authorData[0])
                        Link(destination: URL(string: authorData[0].link)!) {
                            InfoCardView(title: "\(authorData[0].name)'s Wiki", image: Image(systemName: "link"))
                        }
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        NavigationLink(destination: AuthorQuoteListView(authorSlug: authorData[0].slug , authorName: authorData[0].name , totalQuotes: authorData[0].quoteCount, fromExplore: false)) {
                            InfoCardView(title: "Author Quotes", image: Image("forward") , detailTitle: "\(authorData[0].quoteCount)")
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationBarTitle(Text("Author Details"))
    }
}

// MARK: PREVIEW -

struct AuthorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorDetailView(authorSlug: "albert-einstein")
    }
}
