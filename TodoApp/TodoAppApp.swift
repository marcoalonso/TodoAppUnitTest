//
//  TodoAppApp.swift
//  TodoApp
//
// Created by Marco Alonso Rodriguez on 10/05/23.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    let persistenceContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.viewContext)
        }
    }
}
