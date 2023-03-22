//
//  Roomdetial.swift
//  BoardRooms
//
//  Created by Omnya Kamal  on 21/03/2023.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let roomdetials = try? JSONDecoder().decode(Roomdetials.self, from: jsonData)

import Foundation

// MARK: - Roomdetial
struct Roomdetial2: Codable {
    let id: String
    let boardroom: Boardroom
    let date: String
}

// MARK: - Boardroom
struct Boardroom: Codable {
    let name: Name
    let facilities: [Facility]
    let floorNo: Int
    let id: ID
    let description: String
    let imageURL: String
    let noOfSeats: Int

    enum CodingKeys: String, CodingKey {
        case name, facilities
        case floorNo = "floor_no"
        case id, description
        case imageURL = "image_url"
        case noOfSeats = "no_of_seats"
    }
}

enum Facility: String, Codable {
    case microphone = "microphone"
    case projector = "projector"
    case screen = "Screen"
    case wiFi = "Wi-Fi"
}

enum ID: String, Codable {
    case ae1A9C36F49C48B49327Cec2Cb9453C6 = "AE1A9C36-F49C-48B4-9327-CEC2CB9453C6"
    case de1A9C36F49C48B49327Cec2Cb9453C6 = "DE1A9C36-F49C-48B4-9327-CEC2CB9453C6"
    case the7F62674D5Db046779719Cb54Eb6Cabf9 = "7F62674D-5DB0-4677-9719-CB54EB6CABF9"
}

enum Name: String, Codable {
    case creativeSpace = "Creative Space"
    case ideationRoom = "Ideation Room"
    case inspirationRoom = "Inspiration Room"
}

typealias RoomdetialArray = [Roomdetial2]
