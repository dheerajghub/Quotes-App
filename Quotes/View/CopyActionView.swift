//
//  CopyActionView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct CopyActionView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var copiedStateActive: Bool
    @Binding var copyViewScale: CGFloat
    @Binding var copyViewOpacity: Double
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            Image("copied")
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
                .foregroundColor(colorScheme == .dark ? (copiedStateActive ? .black : .white) : (copiedStateActive ? .white : .black))
                .opacity(copyViewOpacity)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(colorScheme == .dark ? (copiedStateActive ? .white : Constants.appSecondary) : (copiedStateActive ? .black : Constants.appSecondary))
                .cornerRadius(22.5)
                .scaleEffect(copyViewScale)
            Spacer()
        }
        .padding(.leading , 30)
    }
}

//struct CopyActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CopyActionView()
//    }
//}
