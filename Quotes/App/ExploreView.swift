//
//  ExploreView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct ExploreView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var tagsVM = TagsViewModel()
    private var gridItemLayout = [GridItem(.flexible()) , GridItem(.flexible())]
    
    init(){
        self.tagsVM.fetchTags()
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                NavigationLink(destination: ExploreAuthorListView()) {
                    InfoCardView(title: "Explore Authors", image: Image("forward"))
                }
                .buttonStyle(PlainButtonStyle())
                if tagsVM.isLoading {
                    ProgressView()
                        .padding(.top , 100)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    CustomTitleView(titleText: "Explore quotes with tags")
                    LazyVGrid(columns: gridItemLayout, spacing: 10) {
                        if let tags = tagsVM.tagsModel {
                            ForEach(tags) { tag in
                                NavigationLink(destination: TagFilteredQuoteListView(tagName: tag.name, quoteCount: tag.quoteCount)) {
                                    TagCardView(tagName: tag.name, quoteCount: tag.quoteCount)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    } //: LAZYVGRID
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
                }
            } //: VSTACK
        } //: SCROLLVIEW
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
