//
//  LoginRespnose.swift
//  task
//
//  Created by ThangTQ on 27/10/2022.
//

import Foundation

struct LoginResponse: Codable {
    let username: String?
    let id: Int?
    let token: String?
    let workspaces: [Workspace]?
}

// MARK: - Workspace
struct Workspace: Codable {
    let id: Int?
    let code, name: String?
    let ownerID: Int?
    let groupTaskDTOS: [GroupTaskDTO]?

    enum CodingKeys: String, CodingKey {
        case id, code, name
        case ownerID = "ownerId"
        case groupTaskDTOS = "groupTaskDTOs"
    }
}

// MARK: - GroupTaskDTO
struct GroupTaskDTO: Codable {
    let id: Int?
    let name: String?
}
