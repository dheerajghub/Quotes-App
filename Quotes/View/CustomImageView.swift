//
//  CustomImageView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 08/07/21.
//

import SwiftUI

struct CustomImageView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var urlImageModel = UrlImageModel()
    
    static var defaultImage = UIImage(named: "logo")
    
    init(urlString: String?) {
        self.urlImageModel.getImage(urlString!)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? CustomImageView.defaultImage!)
            .resizable()
            .scaledToFill()
    }
}

//struct CustomImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomImageView(urlString: "")
//    }
//}
