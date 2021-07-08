//
//  QuotesApp.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 29/06/21.
//

import RealmSwift
import SwiftUI
import Combine

@main
struct QuotesApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            CustomTabView()
                .environment(\.realmConfiguration, Realm.Configuration())
                .onAppear {
                    print(Realm.Configuration.defaultConfiguration.fileURL)
                }
        }
    }
}
