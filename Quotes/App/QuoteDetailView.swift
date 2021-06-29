//
//  QuoteDetailView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct QuoteDetailView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme

    var data: Quote
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
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            QuoteDetailCardView(quoteData: data)
                .offset(y: 12)
            CustomTitleView(titleText: "Author")
                .padding(.top , 20)
            NavigationLink(destination: AuthorDetailView(authorSlug: data.authorSlug)) {
                AuthorNameView(author: data.author)
            }
            .buttonStyle(PlainButtonStyle())
            CustomTitleView(titleText: "Tags")
                .padding(.top , 8)
            QuoteTagsView(tags: data.tags)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationBarTitle(Text("Quote Details"))
    }
}

// MARK: PREVIEW -

struct QuoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailView(data: Quote(tags: ["wisdom"], _id: "", content: "Wisdom is a kind of knowledge. It is knowledge of the nature, career, and consequences of human values.", author: "Helmut Sigmund", authorSlug: ""))
    }
}
