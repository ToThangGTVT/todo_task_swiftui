//
//  TaskViewModel.swift
//  task
//
//  Created by ToThang on 10/19/22.
//

import Foundation
import SwiftUI
import RxCocoa
import RxSwift

class LoginViewModel: BaseViewModel {
        
    @Published var value: String = ""
    @Published var isPresentedHome: Bool = false
    
    func callApiDogRandom() {
        service.callApiGet(url: "https://dog.ceo/api/breeds/image/random", returnType: RandomDogModel.self) { [ weak self ] res in
            DispatchQueue.main.async {
                self?.value = res.message
            }
        }
    }
    
    func callApiLogin(username: String, password: String) {
        let loginRequest = LoginRequest(username: username, password: password)
        service.post(url: Constant.BASE_URL + "api-login", body: loginRequest, typeResponse: LoginResponse.self) { [ weak self ] res in
            DispatchQueue.main.async {
                self?.isPresentedHome = true
                guard var token = res.token else { return }
                token = "Authorization=" + token
                UserDefaultManager.shared.saveToken(token: token)
            }
        }
    }
    
}
