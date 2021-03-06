//
//  ActionCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct ActionCardView: View {
    
    // MARK: PROPERTIES -
    
    var data: ActionViewData
    
    // MARK: BODY -
    
    var body: some View {
        VStack(alignment: .center, spacing: 7){
            ZStack {
                
                if data.type == "image" {
                    // IMAGE OPTION
                    Image(uiImage: (data.image ?? UIImage(named: "logo"))!)
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.white , lineWidth: 2)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                
                if data.type == "color" {
                    // COLOR OPTION
                    data.color
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.white , lineWidth: 2)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                }
                
                if data.type == "text" {
                    // TEXT OPTION
                    Text(data.text)
                        .font(.custom(Constants.fontItalic, size: 23))
                        .frame(width: 70, height: 70)
                        .background(Constants.appSecondary)
                        .multilineTextAlignment(.center)
                        .cornerRadius(35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(Color.white , lineWidth: 2)
                        )
                }
                
            }
            Text(data.title)
                .font(.custom(Constants.fontPoppinsRegular, size: 14))
                .multilineTextAlignment(.center)
        }
    }
}

struct ActionCardView_Previews: PreviewProvider {
    static var previews: some View {
        ActionCardView(data: ActionViewData(type: "color", image: nil, text: "", color: nil , title: "", toggleView: ""))
    }
}
