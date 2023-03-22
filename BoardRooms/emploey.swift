//
//  emploey.swift
//  BoardRooms
//
//  Created by Hibah Abdullah Alatawi on 29/08/1444 AH.
//

import Foundation
struct Employee: Codable {
    let id: Int
    let name, jobTitle, password: String
    
    enum CodingKeys: String, CodingKey{
        case id, name
        case jobTitle = "job_title"
        case password
    }
}
