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
    @Published var isLoginSuccess: Bool = false
    
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
    
    func callApiLogin(username: String, password: String) {
        let loginRequest = LoginRequest(username: username, password: password)
        service.post(url: Constant.BASE_URL + "/api-login", body: loginRequest, type: LoginResponse.self) { [ weak self ] res in
            DispatchQueue.main.async {
                self?.isLoginSuccess = true
            }
            
        }
    }
}
