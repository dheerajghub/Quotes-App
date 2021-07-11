//
//  CustomBCOpacityView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 09/07/21.
//

import SwiftUI

struct CustomBCOpacityView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var bcOpacity: CGFloat
    @Binding var hideOpacityView: Bool
    
    
    // MARK: BODY -
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack {
                Slider(value: $bcOpacity, in: 0...1)
                Text("\(bcOpacity, specifier: "%.1f")")
            } //: VSTACK
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            .frame(maxHeight: .infinity)
            
            Button {
                hideOpacityView = true
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

//struct CustomBCOpacityView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomBCOpacityView()
//    }
//}
