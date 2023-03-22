
//
//  BookingsCollectionViewCell.swift
//  BoardRooms
//
//  Created by Omnya Kamal  on 19/03/2023.
//

import UIKit

class BookingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var circleImageView: UIImageView!
    func setUpCell(day: String, date: String, isSelected: Bool) {
        dayLabel.text = day
        dateLabel.text = date
        circleImageView.image = UIImage(systemName: "circle.fill")
        if isSelected {
            circleImageView.tintColor = UIColor(red: 0.83, green: 0.37, blue: 0.22, alpha: 1.00)
        } else {
            circleImageView.tintColor = .white
        }
    }
}
