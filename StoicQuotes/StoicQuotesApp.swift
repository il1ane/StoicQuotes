//
//  StoicQuotesApp.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import SwiftUI

@main
struct StoicQuotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
