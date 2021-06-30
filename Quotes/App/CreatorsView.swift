//
//  CreatorsView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 30/06/21.
//

import SwiftUI

struct CreatorsView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var fixedHeight: CGFloat = UIScreen.main.bounds.width
    var quoteContent: String = ""
    var ratiosArr = [["1" , "1"] , ["4" , "5"] , ["9" , "16"] , ["1.91" , "1"]]
    
    @State var ratio: [CGFloat] = [1,1]
    @State var i = 0
    @State var fontColor: Color = .white
    @State var backgroundColor: Color = .black
    @State var textColor: Color = .white
    @State var fontSize: CGFloat = 20
    
    init(quoteContent: String){
        self.quoteContent = quoteContent
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: Constants.fontBold, size: 20)!]
    }
    
    // MARK: BODY -
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomLeading){
                    ZStack {
                        QuotePostView
                    } //: FIRST INNER ZSTACK
                    .frame(width: fixedHeight, height: fixedHeight)
                    
                    ZStack {
                        Button {
                            withAnimation(.spring()) {
                                i = i + 1
                                if i == ratiosArr.count {
                                    i = 0
                                }
                                ratio = [StringToFloat(str: ratiosArr[i][0]) , StringToFloat(str: ratiosArr[i][1])]
                            }
                        } label: {
                            HStack {
                                Image("ratio")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color.white)
                                
                                Text("\(ratiosArr[i][0]) : \(ratiosArr[i][1])")
                                    .foregroundColor(.white)
                            } //: HSTACK
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(22.5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 22.5)
                                    .stroke(.white , lineWidth: 1)
                            )
                        }
                    } //: SECOND INNER ZSTACK
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                    
                    // DIVDER VIEW
                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(Color.gray.opacity(0.7))
                            .frame(height: 0.7)
                    }
                    
                } //: OUTER ZSTACK
                .frame(width: fixedHeight, height: fixedHeight)
                .background(Color.white)
                
                // ACTION VIEW
                CreatorActionView(backgroundColor: $backgroundColor, textColor: $textColor , fontSize: $fontSize)
                
                Spacer()
            } //: VSTACK
            .navigationBarTitle("Creator View")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("close")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                    }
                }
            }
        } //: NAVIGATION VIEW
        .accentColor(colorScheme == .dark ? .white : .black)
    }
    
    // MARK: CUSTOM VIEW -
    
    var QuotePostView: some View {
        HStack {
            Text(quoteContent)
                .foregroundColor(fontColor)
                .font(.custom(Constants.fontRegular, size: fontSize))
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(width: calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) > fixedHeight ? fixedHeight - 40 : calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) , height: calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) > fixedHeight ? calculateHeightRatio(for: fixedHeight - 40, ratio: ratio) : fixedHeight - 40)
        .background(backgroundColor)
        .shadow(color: .black.opacity(0.12), radius: 15, x: 0, y: 7)
    }
    
    // MARK: FUNCTIONS -
    
    func calculateWidthRatio(for height: CGFloat , ratio: [CGFloat]) -> CGFloat {
        let width = height * (ratio[0]/ratio[1])
        return width
    }
    
    func calculateHeightRatio(for width: CGFloat , ratio: [CGFloat]) -> CGFloat {
        let height = width * (ratio[1]/ratio[0])
        return height
    }
    
    func StringToFloat(str: String) -> CGFloat {
        let string = str
        var cgFloat:CGFloat = 0
        if let doubleValue = Double(string){
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
     }
    
}

struct CreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorsView(quoteContent: "")
    }
}
