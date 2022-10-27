//
//  ContentView.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: TaskViewModel
    
    var body: some View {
        LoginView().environmentObject(viewModel)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
