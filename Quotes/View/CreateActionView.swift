//
//  CreateActionView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct CreateActionView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var creatingStateActive: Bool
    @Binding var createViewScale: CGFloat
    @Binding var createViewOpacity: Double
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            Image("create")
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
                .foregroundColor(colorScheme == .dark ? .white : (creatingStateActive ? .white : .black))
                .opacity(createViewOpacity)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(colorScheme == .dark ? (creatingStateActive ? Constants.appBlue : Constants.appSecondary) : (creatingStateActive ? Constants.appBlue : Constants.appSecondary))
                .cornerRadius(22.5)
                .scaleEffect(createViewScale)
            Spacer()
        }
        .padding(.leading , 30)
    }
}

//struct CreateActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateActionView()
//    }
//}
