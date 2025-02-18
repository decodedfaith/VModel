//
//  VModelApp.swift
//  VModel
//
//  Created by user on 2/18/25.
//

import SwiftUI

@main
struct VModelApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
