//
//  BookingsCollectionViewCell.swift
//  BoardRooms
//
//  Created by Omnya Kamal  on 19/03/2023.
//

import UIKit

class BookingsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblBookingDay: UILabel!
    @IBOutlet weak var imgBookingCircle: UIImageView!
    @IBOutlet weak var lblBookingDate: UILabel!
    
    func setUpCell( day : String, date : String, circleImg : UIImage){
        lblBookingDay.text = day
        lblBookingDate.text = date
        imgBookingCircle.image = circleImg
    
    }
}
