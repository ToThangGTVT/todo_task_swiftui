//
//  LoginView.swift
//  task
//
//  Created by ToThang on 10/26/22.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    func actionLogin() {
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username").padding([.leading, .trailing], 24)
            TextField("Username here...", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3)
                .padding([.leading, .trailing], 24)
            Text("Password").padding([.leading, .trailing], 24)
            TextField("Password here...", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(3)
                .padding([.leading, .trailing], 24)
            HStack {
                Button(action: {
                    actionLogin()
                }) {
                    Text("Login").frame(minWidth: 300, minHeight: 45).background(RoundedRectangle(cornerRadius: 5).fill(Color.blue)).foregroundColor(.white)
                }.padding([.leading, .trailing], 24)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
