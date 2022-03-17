//
//  BookWorm_100SUI_11App.swift
//  BookWorm-100SUI-11
//
//  Created by Duncan Kent on 16/03/2022.
//

import SwiftUI

@main
struct BookWorm_100SUI_11App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
