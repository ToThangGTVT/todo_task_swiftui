//
//  taskApp.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import SwiftUI

@main
struct taskApp: App {
    var body: some Scene {
        
        let networkManager = NetworkManager()
        let taskViewModel = LoginViewModel(service: networkManager)
        let noteViewModel = NoteViewModel(service: networkManager)
        
        WindowGroup {
            ContentView()
                .environmentObject(taskViewModel)
                .environmentObject(noteViewModel)
        }
    }
}
