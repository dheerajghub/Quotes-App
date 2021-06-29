//
//  AuthorInfoView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct AuthorInfoView: View {
    
    // MARK: PROPERTIES -
    
    var authorData: Author
    
    // MARK: BODY -
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(authorData.name)
                        .font(.custom(Constants.fontBold, size: 27))
                    Text(authorData.description)
                        .font(.custom(Constants.fontItalic, size: 15))
                    Text(authorData.bio)
                        .font(.custom(Constants.fontRegular, size: 17))
                        .padding(.top , 10)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
    }
}

// MARK: PREVIEW -

struct AuthorInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorInfoView(authorData: Author(link: "", bio: "", description: "", _id: "", name: "", quoteCount: 2, slug: ""))
            .previewLayout(.sizeThatFits)
    }
}

