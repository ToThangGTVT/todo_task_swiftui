//
//  BaseViewModel.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import Foundation
import SwiftUI

class BaseViewModel: ObservableObject {
    
    @ObservedObject var service: NetworkManager

    init(service: NetworkManager) {
        self.service = service
    }
}
