//
//  ImageCategoryView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 09/07/21.
//

import SwiftUI

struct ImageCategoryView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var imageVM = ImageViewModel()
    @ObservedObject var urlImageModel = UrlImageModel()
    
    @Environment(\.colorScheme) var colorScheme
    var gridItemLayout = [GridItem(.flexible())]
    
    @Binding var backgroundImage: UIImage?
    @Binding var imageCategory: String
    @Binding var hideImageCategoryView: Bool
    @Binding var hideActionView: Bool
    @Binding var isOpacityButtonAvailable: Bool
    
    @State var hideImageListView: Bool = true
    
    let categoryData = [
        CategoryData(name: "none", image: "none"),
        CategoryData(name: "nature", image: "nature-cat"),
        CategoryData(name: "inspiration", image: "inspiration-cat"),
        CategoryData(name: "music", image: "music-cat"),
        CategoryData(name: "art", image: "art-cat"),
        CategoryData(name: "technology", image: "technology-cat"),
        CategoryData(name: "happiness", image: "happiness-cat"),
        CategoryData(name: "education", image: "education-cat"),
        CategoryData(name: "history", image: "history-cat"),
        CategoryData(name: "success", image: "success-cat")
    ]
    
    // MARK: MAIN -
    
    var body: some View {
        if hideImageListView {
            ZStack(alignment: .topTrailing){
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 10) {
                        ForEach(categoryData){ category in
                            Button {
                                if category.name == "none" {
                                    backgroundImage = nil
                                    hideActionView = false
                                    hideImageCategoryView = true
                                    isOpacityButtonAvailable = false
                                } else {
                                    imageCategory = category.name
                                    hideImageListView = false
                                    self.imageVM.fetchSearchedImage(for: 1, search: category.name)
                                }
                            } label: {
                                VStack {
                                    Image(category.image)
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
                                    Text(category.name.uppercased())
                                        .font(.custom(Constants.fontPoppinsRegular, size: 14))
                                        .multilineTextAlignment(.center)
                                }//: VSTACK
                            }
                        }
                    }//: HSTACK
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    .frame(height: 100)
                } //: SCROLLVIEW
                .frame(maxHeight: .infinity)
                Button {
                    hideActionView = false
                    hideImageCategoryView = true
                    isOpacityButtonAvailable = false
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
        } else {
            ZStack(alignment: .topTrailing){
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: gridItemLayout, spacing: 12) {
                        if imageVM.isLoading {
                            ProgressView()
                                .frame(width: 100, height: 100)
                                .progressViewStyle(CircularProgressViewStyle())
                        } else {
                            if let imagesData = imageVM.imagesModel?.photos {
                                ForEach(imagesData){ imageData in
                                    Button {
                                        urlImageModel.getImage(imageData.src.medium)
                                        backgroundImage = urlImageModel.image
                                        hideImageListView = true
                                    } label: {
                                        CustomImageView(urlString: imageData.src.medium)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.white , lineWidth: 2)
                                            )
                                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                                    }
                                } //: LOOP
                                if let imageTotalCount = imageVM.imagesModel?.total_results {
                                    if imageTotalCount > imagesData.count {
                                        ProgressView()
                                            .padding()
                                            .progressViewStyle(CircularProgressViewStyle())
                                            .onAppear(perform: {
                                                if let page = imageVM.imagesModel?.page {
                                                    self.imageVM.fetchSearchedImage(for: page + 1, search: imageCategory)
                                                }
                                            })
                                    }
                                }
                            }
                        }
                    }//: LAZYHGRID
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                } //: SCROLLVIEW
                .frame(maxHeight: .infinity)
                Button {
                    hideImageListView = true
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
    
}

//struct ImageCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCategoryView()
//    }
//}
