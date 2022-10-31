//
//  NoteCreateRequest.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import Foundation

struct NoteCreateRequest: Codable {
    var id: Int?
    var createDate, content, title: String?
    var isDelete, isFavorite, isFirstDisplay: Bool?
    
    init() {
        
    }
}
