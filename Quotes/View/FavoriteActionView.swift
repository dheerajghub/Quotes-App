//
//  FavoriteActionView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct FavoriteActionView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var favouriteStateActive: Bool
    @Binding var favouriteViewOpacity: Double
    @Binding var favouriteViewScale: CGFloat
    var isQuoteExist: Bool
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            Spacer()
            Image(isQuoteExist ? "delete" : "favourite-selected")
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    isQuoteExist ?
                        colorScheme == .dark ? .white : (favouriteStateActive ? .white : .black)
                    :
                        colorScheme == .dark ? .white : (favouriteStateActive ? .white : .black)
                )
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .opacity(favouriteViewOpacity)
                .background(
                    isQuoteExist ?
                        colorScheme == .dark ? (favouriteStateActive ? .red : Constants.appSecondary) : (favouriteStateActive ? .red : Constants.appSecondary)
                    :
                        colorScheme == .dark ? (favouriteStateActive ? Constants.appGreen : Constants.appSecondary) : (favouriteStateActive ? Constants.appGreen : Constants.appSecondary)
                )
                .cornerRadius(22.5)
                .scaleEffect(favouriteViewScale)
        }
        .padding(.trailing , 30)
    }
}

//struct FavoriteActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteActionView()
//    }
//}
