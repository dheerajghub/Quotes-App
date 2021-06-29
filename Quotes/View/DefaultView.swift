//
//  DefaultView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct DefaultView: View {
    
    // MARK: PROPERTIES -
    
    var title: String = "Nothing on list"
    
    // MARK: BODY -
    
    var body: some View {
        Text(title)
            .font(.custom(Constants.fontRegular, size: 20))
            .foregroundColor(.gray)
            .padding(.top , 100)
    }
}

struct DefaultView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultView()
    }
}
