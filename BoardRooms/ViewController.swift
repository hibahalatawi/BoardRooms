//
//  ViewController.swift
//  BoardRooms
//
//  Created by Hibah Abdullah Alatawi on 21/08/1444 AH.
//

import UIKit
//Heba
class ViewControllerSignin : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DDD")
    }
  
}
//Mai
class ViewControllerMainScreen : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DDD")
    }
  
}
    //Omnya
class ViewControllerDetailRroomScreen: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var CollectionView: UICollectionView!
    var arrBookingCalender = [Booking]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        arrBookingCalender.append(Booking(day: "Thu", date: "16", circleImg: UIImage(systemName: "circle.fill")! ))
        arrBookingCalender.append(Booking(day: "Sun", date: "17", circleImg: UIImage(systemName: "circle.fill")! ))
        arrBookingCalender.append(Booking(day: "Sun", date: "18", circleImg: UIImage(systemName: "circle.fill")! ))
        arrBookingCalender.append(Booking(day: "Sun", date: "19", circleImg: UIImage(systemName: "circle.fill")! ))
        arrBookingCalender.append(Booking(day: "Sun", date: "20", circleImg: UIImage(systemName: "circle.fill")! ))
        arrBookingCalender.append(Booking(day: "Sun", date: "21", circleImg: UIImage(systemName: "circle.fill")! ))
        arrBookingCalender.append(Booking(day: "Sun", date: "22", circleImg: UIImage(systemName: "circle.fill")! ))
        CollectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrBookingCalender.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "BookingCell", for: indexPath) as! BookingsCollectionViewCell
       let bookinData = arrBookingCalender[indexPath.row]
        cell.setUpCell(day: bookinData.day, date: bookinData.date, circleImg: bookinData.circleImg)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Code
    }
    struct Booking{
        let day : String
        let date : String
        let circleImg : UIImage
    }

}
//Areej
class ViewControllerSuccessScreen : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DDD")
    }
  
}

