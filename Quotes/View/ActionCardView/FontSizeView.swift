//
//  FontSizeView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct FontSizeView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var fontSize: CGFloat
    @Binding var hideFontSizeView: Bool
    @Binding var hideActionView: Bool
    
    // MARK: BODY -
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack {
                Slider(value: $fontSize, in: 12...30)
                Text("\(fontSize, specifier: "%.0f")")
            } //: VSTACK
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            .frame(maxHeight: .infinity)
            
            Button {
                hideActionView = false
                hideFontSizeView = true
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
            
        } //: ZSTACK
        .frame(maxHeight: .infinity)
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

//struct FontSizeView_Previews: PreviewProvider {
//    static var previews: some View {
//        FontSizeView()
//    }
//}
