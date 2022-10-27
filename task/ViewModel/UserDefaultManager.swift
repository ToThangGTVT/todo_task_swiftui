//
//  UserDefaultManager.swift
//  task
//
//  Created by ToThang on 10/27/22.
//

import Foundation

class UserDefaultManager {

    static let shared = UserDefaultManager()
    
    func saveToken(token: String) {
        UserDefaults.standard.set(token, forKey: Constant.TOKEN)
    }

    func getToken() -> String? {
        print("token::::\(UserDefaults.standard.string(forKey: Constant.TOKEN))")
        return UserDefaults.standard.string(forKey: Constant.TOKEN)
    }

}
