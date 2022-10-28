//
//  ContentView.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        if UserDefaultManager.shared.getToken() != nil {
            HomeView()
        } else {
            LoginView()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
