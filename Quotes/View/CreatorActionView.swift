//
//  CreatorActionView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct CreatorActionView: View {
    
    // MARK: PROPERTIES -
    
    @Binding var backgroundColor: Color
    @Binding var textColor: Color
    @Binding var fontSize: CGFloat
    
    @State private var data = [ActionViewData]()
    @State var hidePostBGColorView: Bool = true
    @State var hideFontView: Bool = true
    @State var hideFontColorView: Bool = true
    @State var hideFontSizeView: Bool = true
    
    // MARK: BODY -
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(data){ item in
                        Button {
                            if item.toggleView == "PostBackgroundColorView" {
                                hidePostBGColorView.toggle()
                            }
                            if item.toggleView == "FontView" {
                                hideFontView.toggle()
                            }
                            if item.toggleView == "FontSizeView" {
                                hideFontSizeView.toggle()
                            }
                            if item.toggleView == "FontColorView" {
                                hideFontColorView.toggle()
                            }
                        } label: {
                            ActionCardView(data: item)
                                .frame(width: 90, height: 130)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            }
            .frame(maxHeight: .infinity)
    
            if !hidePostBGColorView {
                PostBackgroundColorView(backgroundColor: $backgroundColor, hidePostBGColorView: $hidePostBGColorView)
            }
            
            if !hideFontView {
                FontView()
            }
            
            if !hideFontSizeView {
                FontSizeView()
            }
            
            if !hideFontColorView {
                FontColorView()
            }
            
        }
        .onAppear {
            data = [
                ActionViewData(type: "color", image: nil , text: "", color: backgroundColor, title: "BG Color" , toggleView: "PostBackgroundColorView"),
                ActionViewData(type: "text", image: nil , text: "A", color: nil, title: "Font", toggleView: "FontView"),
                ActionViewData(type: "color", image: nil , text: "", color: textColor, title: "Font Color" , toggleView: "FontColorView"),
                ActionViewData(type: "text", image: nil , text: "13", color: nil, title: "Font Size" , toggleView: "FontSizeView")
            ]
        }
    }
}

//struct CreatorActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatorActionView()
//    }
//}
