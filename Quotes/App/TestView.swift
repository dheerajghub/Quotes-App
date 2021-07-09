//
//  TestView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 08/07/21.
//

import SwiftUI

struct TestView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var imageVM = ImageViewModel()
    private var gridItemLayout = [GridItem(.flexible())]
    
    init(){
        self.imageVM.fetchImage(for: 1)
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if imageVM.isLoading {
                    ProgressView()
                        .padding(.top , 100)
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    if let imagesData = imageVM.imagesModel?.photos {
                        ForEach(imagesData){ imageData in
                            CustomImageView(urlString: imageData.src.small)
                                .frame(width: 150, height: 150, alignment: .center)
                        } //: LOOP
                        if let imageTotalCount = imageVM.imagesModel?.total_results {
                            if imageTotalCount > imagesData.count {
                                ProgressView()
                                    .padding()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .onAppear(perform: {
                                        if let page = imageVM.imagesModel?.page {
                                            self.imageVM.fetchImage(for: page + 1)
                                        }
                                    })
                            }
                        }
                    }
                }
            }//: LAZYVGRID
        }//: SCROLLVIEW
    }
    
    // MARK: FUNCTIONS -
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
