//
//  InfoCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct InfoCardView: View {
    
    // MARK: PROPERTIES -
    
    var title: String
    var image: Image
    var detailTitle: String = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            HStack {
                Text(title)
                    .font(.custom(Constants.fontBold, size: 20))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                    .lineLimit(1)
                Spacer()
                Text(detailTitle)
                    .font(.custom(Constants.fontBold, size: 18))
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 5))
                    .foregroundColor(colorScheme == .dark ? .white : .black.opacity(0.5))
                image
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .padding(.trailing , 15)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            }
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
    }
}

struct InfoCardView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCardView(title: "Wiki", image: Image(systemName: "link"))
            .previewLayout(.sizeThatFits)
    }
}
