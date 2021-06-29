//
//  AuthorNameView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct AuthorNameView: View {
    
    // MARK: PROPERTIES -
    
    var author: String
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            Text(author)
                .font(.custom(Constants.fontItalic, size: 18))
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            Spacer()
            Image("forward")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .frame(width: 20, height: 20)
                .padding(.trailing , 15)
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

// MARK: PREVIEW -

struct AuthorNameView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorNameView(author: "Albert Einstien")
    }
}
