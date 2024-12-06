//
//  TODOSwiftUIAndSwiftDataApp.swift
//  TODOSwiftUIAndSwiftData
//
//  Created by Sarath kumar on 05/12/24.
//

import SwiftUI
import SwiftData

@main
struct TODOSwiftUIAndSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
