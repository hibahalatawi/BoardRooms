//
//  ViewController.swift
//  BoardRooms
//
//  Created by Hibah Abdullah Alatawi on 21/08/1444 AH.
//

import UIKit
//Heba
class ViewController : UIViewController {

   @IBOutlet weak var JobNumber: UITextField!

   @IBOutlet weak var PasswordField: UITextField!

   @IBOutlet weak var buttonlogin: UIButton!
    
    var employe : [Employee]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
       // print("DDD")
    }
    @IBAction func buttonTapped() {
        let employName = JobNumber.text
        let employPassword = PasswordField.text
        JobNumber.resignFirstResponder()
        guard let employe = employe else{return}
        for i in employe{
            if i.name == employName && i.password == employPassword{
                BoardRooms()
                
                performSegue(withIdentifier: "goToHome", sender: nil)
            }
        }
    }
    func getData(){
        //

        if let url = URL(string:"https://0a41c646-1e60-44d1-ad87-0ccd77cf9fad.mock.pstmn.io/employees"){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data{
                    do {
                        let res = try JSONDecoder().decode([Employee].self, from: data)
                        self.employe = res
                        
                        print(res)
                    }catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
//Mai
class BoardRooms : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("DDD")
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
      //  print("DDD")
    }
  
}

