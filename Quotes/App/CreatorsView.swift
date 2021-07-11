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
    var quoteAuthor: String = ""
    var ratiosArr = [["1" , "1"] , ["4" , "5"] , ["9" , "16"] , ["1.91" , "1"]]
    
    @State var ratio: [CGFloat] = [1,1]
    @State var i = 0
    @State var fontColor: Color = .white
    @State var backgroundColor: Color = .black
    @State var backgroundImage: UIImage? = nil
    @State var imageCategory: String = ""
    @State var fontSize: CGFloat = 20
    @State var fontName: String = Constants.fontRegular
    @State var showAuthor: Bool = true
    @State var showingAlert = false
    @State var showLoader: Bool = false
    @State var bcOpacity: CGFloat = 0.7
    @State var hideOpacityView:Bool = true
    @State var isOpacityButtonAvailable: Bool = false
    
    init(quoteContent: String , quoteAuthor: String){
        self.quoteContent = quoteContent
        self.quoteAuthor = quoteAuthor
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: Constants.fontBold, size: 20)!]
    }
    
    // MARK: BODY -
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: CREATOR VIEW -
                VStack {
                    ZStack(alignment: .bottomLeading){
                        ZStack {
                            QuotePostView
                        } //: FIRST INNER ZSTACK
                        .frame(width: fixedHeight, height: fixedHeight)
                        
                        /// Background Opacity Button View
                        
                        ZStack {
                            Button {
                                hideOpacityView.toggle()
                            } label: {
                                HStack {
                                    Spacer()
                                    HStack {
                                        Image("opacityView")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(Color.white)
                                    } //: HSTACK
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(22.5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 22.5)
                                            .stroke(.white , lineWidth: 1)
                                    )
                                    .scaleEffect(isOpacityButtonAvailable ? 1 : 0)
                                    .animation(.spring() , value: isOpacityButtonAvailable)
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        
                        /// Post Ratio View
                        
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
                    
                    // MARK: AUTHOR TOGGLE VIEW -
                    VStack {
                      Toggle(isOn: $showAuthor){
                         Text("Show Author")
                            .font(.custom(Constants.fontPoppinsRegular, size: 16))
                      }
                    }
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    
                    ZStack {
                        
                        // MARK: ACTION VIEW -
                        CreatorActionView(backgroundColor: $backgroundColor, fontColor: $fontColor , fontSize: $fontSize, fontName: $fontName, backgroundImage: $backgroundImage, imageCategory: $imageCategory , isOpacityButtonAvailable: $isOpacityButtonAvailable)
                            .background(colorScheme == .dark ? Color.black : Color.white)
                        
                        // MARK: BACKGROUND OPACITY VIEW -
                        if !hideOpacityView {
                            CustomBCOpacityView(bcOpacity: $bcOpacity, hideOpacityView: $hideOpacityView)
                                .background(colorScheme == .dark ? Color.black : Color.white)
                        }
                        
                    }
                    
                    
                    Spacer()
                } //: VSTACK
                .navigationBarTitle("Creator View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAlert.toggle()
                        } label: {
                            Image("close")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            // Taking snapshot of created post and saving to the photos library
                            let image = QuotePostView.snapshot()
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                            showLoader = true
                            
                        } label: {
                            Image("download")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Are you sure?"),
                        message: Text("Your saved changes will be lost!"),
                        primaryButton: .destructive(Text("Go Back!")) {
                            presentationMode.wrappedValue.dismiss()
                        },
                        secondaryButton: .cancel()
                    )
                }
                
                // MARK: CUSTOM POPUP VIEW -
                if showLoader {
                    CustomAnimationView()
                        .frame(width: 130, height: 50)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 7)
                        .onAppear( perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        })
                }
                
                
            } //: ZSTACK
        } //: NAVIGATION VIEW
        .accentColor(colorScheme == .dark ? .white : .black)
    }
    
    // MARK: CUSTOM VIEW -
    
    var QuotePostView: some View {
        ZStack {
            // Background Image view
            if backgroundImage != nil {
                ZStack {
                    Image(uiImage: backgroundImage!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) > fixedHeight ? fixedHeight - 40 : calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) , height: calculateWidthRatio(for: fixedHeight - 40, ratio: ratio) > fixedHeight ? calculateHeightRatio(for: fixedHeight - 40, ratio: ratio) : fixedHeight - 40)
                        .clipped()
                    Rectangle()
                        .fill(Color.black.opacity(bcOpacity))
                } //: ZSTACK
            }
            
            VStack {
                Text(quoteContent)
                    .foregroundColor(fontColor)
                    .font(.custom(fontName, size: fontSize))
                    .multilineTextAlignment(.center)
                    .padding()
                if showAuthor {
                    Text("- \(quoteAuthor)")
                        .foregroundColor(fontColor)
                        .font(.custom(fontName, size: (fontSize - 7)))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }//: VSTACK
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
        CreatorsView(quoteContent: "", quoteAuthor: "")
    }
}
