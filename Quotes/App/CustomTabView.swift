//
//  CustomTabView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import SwiftUI

struct CustomTabView: View {
    
    // MARK: PROPERTIES -
    
    @State private var selection = 0
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: BODY -
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView()
                .navigationBarTitle(Text("Quotes"))
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                if selection == 0 {
                    Image("home-selected")
                        .renderingMode(.template)
                } else {
                    Image("home")
                        .renderingMode(.template)
                }
                Text("")
            }
            .tag(0)
            
            NavigationView {
                ExploreView()
                .navigationBarTitle(Text("Explore"))
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                if selection == 1 {
                    Image("explore-selected")
                        .renderingMode(.template)
                } else {
                    Image("explore")
                        .renderingMode(.template)
                }
                Text("")
            }
            .tag(1)
            
            NavigationView {
                FavouriteView()
                .navigationBarTitle(Text("Favorite"))
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                if selection == 2 {
                    Image("favourite-selected")
                        .renderingMode(.template)
                } else {
                    Image("favourite")
                        .renderingMode(.template)
                }
                Text("")
            }
            .tag(2)
            
            NavigationView {
                TestView()
                .navigationBarTitle(Text("Test View"))
                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                if selection == 3 {
                    Image("favourite-selected")
                        .renderingMode(.template)
                } else {
                    Image("favourite")
                        .renderingMode(.template)
                }
                Text("")
            }
            .tag(3)
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}

// MARK: PREVIEW -

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
