//
//  App05_Firebase_TodosApp.swift
//  App05-Firebase-Todos
//
//  Created by Luis Javier Canto Hurtado on 28/10/21.
//

import SwiftUI
import Firebase

@main
struct App05_Firebase_TodosApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
