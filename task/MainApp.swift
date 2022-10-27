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
        
        let taskViewModel = LoginViewModel(service: NetworkManager())
        
        WindowGroup {
            ContentView().environmentObject(taskViewModel).environmentObject(taskViewModel)
        }
    }
}
