//
//  TodoApp.swift
//  SaladSampleApp
//
//  Created by Mathijs Bernson on 24/01/2025.
//

import SwiftData
import SwiftUI

@main
struct TodoApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: TodoAppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(appDelegate.modelContainer)
    }
}

class TodoAppDelegate: NSObject, UIApplicationDelegate {
    var modelContainer: ModelContainer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let schema = Schema([
            TodoItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        modelContainer = try! ModelContainer(for: schema, configurations: [modelConfiguration])

        if ProcessInfo().arguments.contains("--Reset") {
        }
        return true
    }
}
