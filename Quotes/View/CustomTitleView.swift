//
//  CustomTitleView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct CustomTitleView: View {
    
    // MARK: PROPERTIES -
    
    @Environment(\.colorScheme) var colorScheme
    
    var titleText: String
    
    // MARK: BODY -
    
    var body: some View {
        HStack {
            Text(titleText.uppercased())
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black.opacity(0.8))
                .font(.footnote)
                .bold()
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 5, trailing: 20))
    }
}

struct CustomTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitleView(titleText: "Author")
    }
}
