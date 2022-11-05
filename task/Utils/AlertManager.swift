//
//  AlertManager.swift
//  task
//
//  Created by ToThang on 11/5/22.
//

import Foundation
import UIKit

enum TypeAlert {
    case inputIsNotEmpty
    case saveSuccess
}

class AlertManager {
    
    static let share: AlertManager = AlertManager()
    private var rootViewController = getTopMostViewController()
    
    private init() {
        
    }
    
    func show(type: TypeAlert, action1: ((UIAlertAction) -> Void)? = nil, action2: ((UIAlertAction) -> Void)? = nil) {
        
        switch type {
        case .inputIsNotEmpty:
            let alert = UIAlertController(title: "Error", message: "Title and content must not empty", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            rootViewController?.present(alert, animated: true, completion: nil)
            
        case .saveSuccess:
            let alert = UIAlertController(title: "Success", message: "Create note done!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: action1))
            alert.addAction(UIAlertAction(title: "Edit continue", style: UIAlertAction.Style.default, handler: action2))
            rootViewController?.present(alert, animated: true, completion: nil)

        }
    }
    
}
