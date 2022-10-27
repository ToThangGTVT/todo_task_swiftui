//
//  TaskViewModel.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
        
    @ObservedObject var service: NetworkManager
    @Published var value: String = ""
    
    init(service: NetworkManager) {
        self.service = service
    }
    
    func callApiDogRandom() {
        service.callApiGet(url: "https://dog.ceo/api/breeds/image/random", type: RandomDogModel.self) { [ weak self ] res in
            print(res.message)
            DispatchQueue.main.async {
                self?.value = res.message
            }
        }
    }
    
    func callApiLogin() {
        let loginRequest = LoginRequest(username: "guest", password: "guestguest")
        service.post(url: Constant.BASE_URL + "api/login", body: loginRequest, type: LoginResponse.self) { [ weak self ] res in
            print("xxxxxx")
        }
    }
}
