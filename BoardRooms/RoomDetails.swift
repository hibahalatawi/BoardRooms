//
//  RoomDetails.swift
//  BoardRooms
//
//  Created by Omnya Kamal  on 20/03/2023.
//

import Foundation
class RoomDetails: Codable {
    var name: String
    var facilities: [String]
    var floor_no: Int
    var id: String
    var description: String
    var image_url: String
    var no_of_seats: Int
    var date: String
    
    init(name: String, facilities: [String], floor_no: Int, id: String, description: String, image_url: String, no_of_seats: Int, date: String) {
        self.name = name
        self.facilities = facilities
        self.floor_no = floor_no
        self.id = id
        self.description = description
        self.image_url = image_url
        self.no_of_seats = no_of_seats
        self.date = date
    }
    
}
