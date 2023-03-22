//
//  Reservation.swift
//  BoardRooms
//
//  Created by Omnya Kamal  on 21/03/2023.
//This class for the dates wich is in Omnya screen "details of room"

import Foundation
class Reservation : Decodable {
    var date: Date
    var employeeId: Int
    var boardroomId: String
    
    init(date: Date, employeeId: Int, boardroomId: String) {
        self.date = date
        self.employeeId = employeeId
        self.boardroomId = boardroomId
    }
    
    convenience init?(json: [String: Any]) {
        guard let dateString = json["date"] as? String,
            let date = ISO8601DateFormatter().date(from: dateString),
            let employee = json["employee"] as? [String: Any],
            let employeeId = employee["id"] as? Int,
            let boardroom = json["boardroom"] as? [String: Any],
            let boardroomId = boardroom["id"] as? String else {
                return nil
        }
        self.init(date: date, employeeId: employeeId, boardroomId: boardroomId)
    }
}
