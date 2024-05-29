//
//  EmployeeAssignmentApp.swift
//  EmployeeAssignment
//
//  Created by SpringCT on 29/05/24.
//

import SwiftUI

@main
struct EmployeeAssignmentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
