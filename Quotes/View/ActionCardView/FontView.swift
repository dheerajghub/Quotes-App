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
    
    let fontArr = [Constants.fontRegular , Constants.fontGaramondRoman , Constants.fontFreightSansBook , Constants.fontVollkornItalic , Constants.fontGothamLight , Constants.fontMontserratRegular , Constants.fontDancingScriptRegular, Constants.fontOpenSansRegular, Constants.fontTimesNewRoman , Constants.fontPoppinsRegular , Constants.fontNunitoRegular]
    
    @Binding var fontName: String
    @Binding var hideFontView: Bool
    @Binding var hideActionView: Bool
    
    // MARK: BODY -
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(fontArr, id: \.self) { font in
                        Button {
                            fontName = font
                        } label: {
                            VStack {
                                Text("Ag")
                                    .font(.custom(font, size: 23))
                                    .frame(width: 70, height: 70)
                                    .background(Constants.appSecondary)
                                    .multilineTextAlignment(.center)
                                    .cornerRadius(35)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 35)
                                            .stroke(Color.white , lineWidth: 2)
                                    )
                                Rectangle()
                                    .fill(colorScheme == .dark ? (fontName == font ? .white : .black ) : (fontName == font ? .black : .white ))
                                    .frame(width: fontName == font ? 10 : 5 , height: 5)
                                    .cornerRadius(2.5)
                                    .animation(.easeInOut)
                            }//: VSTACK
                        }
                    }
                }//: HSTACK
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                .frame(height: 100)
            }//: SCROLLVIEW
            .frame(maxHeight: .infinity)
            
            Button {
                hideActionView = false
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
