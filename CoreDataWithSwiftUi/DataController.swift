//
//  DataController.swift
//  CoreDataWithSwiftUi
//
//  Created by Gaurav Tak on 29/07/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataWithSwiftUi")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

