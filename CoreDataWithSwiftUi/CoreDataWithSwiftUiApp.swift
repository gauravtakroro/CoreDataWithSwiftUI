//
//  CoreDataWithSwiftUiApp.swift
//  CoreDataWithSwiftUi
//
//  Created by Roro Solutions LLP on 29/07/23.
//

import SwiftUI

@main
struct CoreDataWithSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
