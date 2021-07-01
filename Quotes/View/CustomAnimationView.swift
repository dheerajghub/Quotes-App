//
//  CustomAnimationView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 01/07/21.
//

import SwiftUI

struct CustomAnimationView: View {
    
    // MARK: PROPERTIES -
    
    @State private var shouldAnimate = false
    
    // MARK: BODY -
        
    var body: some View {
        HStack {
            Circle()
                .fill(Color.black)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever() , value: shouldAnimate)
            Circle()
                .fill(Color.black)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3) , value: shouldAnimate)
            Circle()
                .fill(Color.black)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6) , value: shouldAnimate)
        }
        .onAppear {
            self.shouldAnimate = true
        }
    }
    
}

struct CustomAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationView()
    }
}
