//
//  NoteCreateResponse.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import Foundation

struct NoteCreateResponse: Codable {
    let id: Int?
    let createDate, content, title: String?
    let isDelete, isFavorite, isFirstDisplay: Bool?
}
