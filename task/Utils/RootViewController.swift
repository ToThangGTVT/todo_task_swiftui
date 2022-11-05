//
//  RootViewController.swift
//  task
//
//  Created by ToThang on 11/5/22.
//

import Foundation
import SwiftUI

func getTopMostViewController() -> UIViewController? {
    var topMostViewController = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?.rootViewController
    
    
    while let presentedViewController = topMostViewController?.presentedViewController {
        topMostViewController = presentedViewController
    }
    return topMostViewController
}

