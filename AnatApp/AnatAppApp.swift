//
//  AnatAppApp.swift
//  AnatApp
//
//  Created by Mashael Alghunaim on 03/08/1444 AH.
//

import SwiftUI

@main
struct AnatAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          //  BreathingView()
           // ContentView()
            groundingPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
