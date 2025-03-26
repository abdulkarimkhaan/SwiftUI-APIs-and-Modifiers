//
//  SwiftUI_Useful_ComponentsApp.swift
//  SwiftUI Useful Components
//
//  Created by Abdul Karim Khan on 09/09/2024.
//

import SwiftUI
import TipKit

@main
struct SwiftUI_Useful_ComponentsApp: App {
    var body: some Scene {
        WindowGroup {
            SpaceDashboard()
                .task {
                    // Configure and load your tips at app launch.
                    do {
                        try Tips.configure([
                            .displayFrequency(.immediate)
                        ])
                    }
                    catch {
                        // Handle TipKit errors
                        print("Error initializing TipKit \(error.localizedDescription)")
                    }
                }
        }
    }
}
