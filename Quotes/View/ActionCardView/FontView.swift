//
//  FontView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct FontView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var hideFontView: Bool
    
    // MARK: BODY -
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            HStack {
                Text("Comming in next update!")
                    .font(.custom(Constants.fontBold, size: 24))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button {
                hideFontView = true
            } label: {
                Image("close")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Constants.appSecondary)
                    .cornerRadius(20)
            }
            .padding(.trailing , 5)
        }
        .frame(maxHeight: .infinity)
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

//struct FontView_Previews: PreviewProvider {
//    static var previews: some View {
//        FontView()
//    }
//}
