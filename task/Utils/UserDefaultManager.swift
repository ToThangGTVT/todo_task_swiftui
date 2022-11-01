//
//  UserDefaultManager.swift
//  task
//
//  Created by ToThang on 10/27/22.
//

import Foundation

class UserDefaultManager {

    static let shared = UserDefaultManager()
    
    private init() { }
    
    func saveToken(token: String) {
        UserDefaults.standard.set(token, forKey: Constant.TOKEN)
    }

    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: Constant.TOKEN)
    }

}
