//
//  CoreDataWithSwiftUiApp.swift
//  CoreDataWithSwiftUi
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

@main
struct CoreDataWithSwiftUiApp: App {
   @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
