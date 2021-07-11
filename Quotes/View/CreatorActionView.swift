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
    @Binding var fontColor: Color
    @Binding var fontSize: CGFloat
    @Binding var fontName: String
    @Binding var backgroundImage: UIImage?
    @Binding var imageCategory: String
    @Binding var isOpacityButtonAvailable: Bool
    
    @State private var data = [ActionViewData]()
    @State var hidePostBGColorView: Bool = true
    @State var hideFontView: Bool = true
    @State var hideFontColorView: Bool = true
    @State var hideFontSizeView: Bool = true
    @State var hideImageCategoryView: Bool = true
    @State var hideActionView: Bool = false
    
    // MARK: BODY -
    
    var body: some View {
        ZStack {
            if !hideActionView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(data){ item in
                            Button {
                                if item.toggleView == "PostBackgroundColorView" {
                                    hidePostBGColorView.toggle()
                                    hideActionView.toggle()
                                }
                                if item.toggleView == "FontView" {
                                    hideFontView.toggle()
                                    hideActionView.toggle()
                                }
                                if item.toggleView == "FontSizeView" {
                                    hideFontSizeView.toggle()
                                    hideActionView.toggle()
                                }
                                if item.toggleView == "FontColorView" {
                                    hideFontColorView.toggle()
                                    hideActionView.toggle()
                                }
                                if item.toggleView == "ImageCategoryView" {
                                    hideImageCategoryView.toggle()
                                    hideActionView.toggle()
                                    isOpacityButtonAvailable = true
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
                .onAppear {
                    setData()
                }
            }
            
            if !hidePostBGColorView {
                PostBackgroundColorView(backgroundColor: $backgroundColor, hidePostBGColorView: $hidePostBGColorView , hideActionView: $hideActionView)
            }
            
            if !hideFontView {
                FontView(fontName: $fontName, hideFontView: $hideFontView , hideActionView: $hideActionView)
            }
            
            if !hideFontSizeView {
                FontSizeView(fontSize: $fontSize, hideFontSizeView: $hideFontSizeView , hideActionView: $hideActionView)
            }
            
            if !hideFontColorView {
                FontColorView(fontColor: $fontColor, hideFontColorView: $hideFontColorView , hideActionView: $hideActionView)
            }
            
            if !hideImageCategoryView {
                ImageCategoryView(backgroundImage: $backgroundImage, imageCategory: $imageCategory, hideImageCategoryView: $hideImageCategoryView, hideActionView: $hideActionView , isOpacityButtonAvailable: $isOpacityButtonAvailable)
            }
            
        }
        .onAppear {
            setData()
        }
    }
    
    // MARK: FUNCTIONS -
    
    func setData(){
        data = [
            ActionViewData(type: "color", image: nil , text: "", color: backgroundColor, title: "BG Color" , toggleView: "PostBackgroundColorView"),
            ActionViewData(type: "color", image: nil , text: "", color: fontColor, title: "Font Color" , toggleView: "FontColorView"),
            ActionViewData(type: "text", image: nil , text: "\(Int(fontSize))", color: nil, title: "Font Size" , toggleView: "FontSizeView"),
            ActionViewData(type: "text", image: nil , text: "Ag", color: nil, title: "Font", toggleView: "FontView"),
            ActionViewData(type: "image", image: backgroundImage , text: "", color: nil, title: "BC Image", toggleView: "ImageCategoryView")
        ]
    }
}

//struct CreatorActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatorActionView()
//    }
//}
