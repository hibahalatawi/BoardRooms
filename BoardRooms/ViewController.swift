//
//  ViewController.swift
//  BoardRooms
//
//  Created by Hibah Abdullah Alatawi on 21/08/1444 AH.
//

import UIKit
//Heba
class ViewControllerSignin : UIViewController {
    
    @IBOutlet weak var JobNumber: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DDD")
    }
    
}
//Mai
class ViewControllerMainScreen : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }}
        
//Omnya
class ViewControllerDetailRroomScreen: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - outlets:
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var floorNumLabel: UILabel!
    
    @IBOutlet weak var numOfSeatsLabel: UILabel!
    
    @IBOutlet weak var facilitiesListLabel: UILabel!
    // arrBookingCalender array that holds the dates.
    var arrBookingCalender = [Booking]()
    //Object of type RoomDetails to take the data from it.
    let room = RoomDetails(name: "Creative Space", facilities: ["Wifi","Screen"], floor_no: 5, id: "50BFC6EA-0B33-410E-A6ED-1AAFB92DEC41", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.", image_url: "https://firebasestorage.googleapis.com/v0/b/nanochallenge2-9404d.appspot.com/o/Creative%20Space.png?alt=media&token=8506f468-7d0a-4516-b9f7-45fe7fe59068", no_of_seats: 1, date:"2023-03-15T00:00:00Z")

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - dding the description to the view:
        descriptionLabel.text = room.description
        
        //MARK: - Adding the Img to the view:
        if let imageUrl = URL(string: room.image_url),
           let imageData = try? Data(contentsOf: imageUrl),
           let image = UIImage(data: imageData) {
            imageView.image = image
        }
        
        floorNumLabel.text = "Floor \(room.floor_no)"
        numOfSeatsLabel.text = String( room.no_of_seats)
        facilitiesListLabel.text = room.facilities.joined()
        
        //MARK: - Handeling Post Booking API:
//        let baseURL = "https://ac2b02b3-cede-4dfd-90df-aa78f688cb6e.mock.pstmn.io"
//        guard let url = URL(string: baseURL+"/bookings") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//             //Unwrap the data and decode it using JSONDecoder
//                            guard let data = data else {
//                                print("Error: No data returned")
//                                return
//                            }
//
//
//
//                            do {
//                                let decoder = JSONDecoder()
//                                // Decode the data into an array of Room objects
//                                let rooms = try decoder.decode([BoardRooms.RoomDetails].self, from: data)
//                                for room in rooms {
//                                    print(room.date)
//                                }
//                            } catch let error {
//                                print("Error decoding data: \(error)")
//                            }
//                        }
//        task.resume()
        
            let baseURL = "https://0a41c646-1e60-44d1-ad87-0ccd77cf9fad.mock.pstmn.io"
            // Define the URL of the API endpoint
            guard let url = URL(string: baseURL+"/bookings") else {
                return
            }

            // Create a URLSession to make the request
            let session = URLSession.shared

            // Create a data task to fetch the data from the API
            let task = session.dataTask(with: url) { (data, response, error) in
                // Handle any errors
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }

                // Unwrap the data and decode it using JSONDecoder
                guard let data = data else {
                    print("Error: No data returned")
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    // Decode the data into an array of Room objects
                    let rooms = try decoder.decode([Roomdetial2].self, from: data)
                    for room in rooms {
                        if room.boardroom.id.rawValue == "DE1A9C36-F49C-48B4-9327-CEC2CB9453C6"{
                            let dateString = room.date
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            guard let date = dateFormatter.date(from: dateString) else {
                                print("Invalid date string")
                                return
                            }

                            let calendar = Calendar.current
                            let dayOfMonth = calendar.component(.day, from: date)
                            let weekday = calendar.component(.weekday, from: date)
                            dateFormatter.locale = Locale(identifier: "en_US")
                            let weekdaySymbol = dateFormatter.shortWeekdaySymbols[weekday - 1]

                            print("Day of the month: \(dayOfMonth)")
                            print("Day of the week: \(weekdaySymbol)")
                        }
                    }
                } catch let error {
                    print("Error decoding data: \(error)")
                }
            }

            // Start the data task
            task.resume()
        
    
        
//            let baseURL = "https://ac2b02b3-cede-4dfd-90df-aa78f688cb6e.mock.pstmn.io"
//            // Define the URL of the API endpoint
//            guard let url = URL(string: baseURL+"/bookings") else {
//                return
//            }
//
//            // Create a URLSession to make the request
//            let session = URLSession.shared
//
//            // Create a data task to fetch the data from the API
//            let task = session.dataTask(with: url) { (data, response, error) in
//                // Handle any errors
//                if let error = error {
//                    print("Error fetching data: \(error)")
//                    return
//                }
//
//                // Unwrap the data and decode it using JSONDecoder
//                guard let data = data else {
//                    print("Error: No data returned")
//                    return
//                }
//
//
//
//                do {
//                    let decoder = JSONDecoder()
//                    // Decode the data into an array of Room objects
//                    let rooms = try decoder.decode([BoardRooms.RoomDetails].self, from: data)
//                    for room in rooms {
//                        print(room.name)
//                    }
//                } catch let error {
//                    print("Error decoding data: \(error)")
//                }
//            }
//
//            // Start the data task
//            task.resume()
        }
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CollectionView.delegate = self
        CollectionView.dataSource = self
        arrBookingCalender.append(Booking(day: "WED", date: "15"))
        arrBookingCalender.append(Booking(day: "THU", date: "16"))
        arrBookingCalender.append(Booking(day: "FRI", date: "17"))
        arrBookingCalender.append(Booking(day: "SAT", date: "18"))
        arrBookingCalender.append(Booking(day: "Sun", date: "19"))
        arrBookingCalender.append(Booking(day: "MON", date: "20"))
        arrBookingCalender.append(Booking(day: "TUE", date: "21"))
        arrBookingCalender.append(Booking(day: "WED", date: "22"))
        arrBookingCalender.append(Booking(day: "THU", date: "23"))
        arrBookingCalender.append(Booking(day: "FRI", date: "24"))
        arrBookingCalender.append(Booking(day: "SAT", date: "25"))
        arrBookingCalender.append(Booking(day: "Sun", date: "26"))
        arrBookingCalender.append(Booking(day: "MON", date: "27"))
        arrBookingCalender.append(Booking(day: "TUE", date: "28"))
        arrBookingCalender.append(Booking(day: "WED", date: "29"))
        arrBookingCalender.append(Booking(day: "THU", date: "30"))
        CollectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrBookingCalender.count
    }
    var selectedIndexPath: IndexPath?
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let indexPath = self.CollectionView?.indexPathForItem(at: sender.location(in: self.CollectionView)) {
            
            print(arrBookingCalender[indexPath.row].date)
            print(arrBookingCalender[indexPath.row].day)
            //Do your stuff here
            
            print("is Seldected !!")
            if indexPath != selectedIndexPath {
                        // Clear the previous selection's tintColor
                        if let previousCell = self.CollectionView?.cellForItem(at: selectedIndexPath ?? indexPath) as? BookingsCollectionViewCell {
                            previousCell.circleImageView.tintColor = .white
                        }
                        
                        // Set the new selection's tintColor
                        if let cell = self.CollectionView?.cellForItem(at: indexPath) as? BookingsCollectionViewCell {
                            cell.circleImageView.tintColor = UIColor(red: 0.83, green: 0.37, blue: 0.22, alpha: 1.00)
                        }
                        
                        // Remember the newly selected index path
                        selectedIndexPath = indexPath
                    }
                }
        }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingCell", for: indexPath) as! BookingsCollectionViewCell
        let bookinData = arrBookingCalender[indexPath.row]
        cell.setUpCell(day: bookinData.day, date: bookinData.date, isSelected: bookinData.isSelected)
        
        
         let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))

        collectionView.addGestureRecognizer(tap)

        collectionView.isUserInteractionEnabled = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        arrBookingCalender[indexPath.row].isSelected = true
        print("didSelectItemAt in collection")
        print(arrBookingCalender[indexPath.row].isSelected)
        // Change circleImageView.tintColor to clear color
            
        collectionView.reloadData()
    }
    
    
  
    //This struct for the collection elments
    struct Booking{
        let day : String
        let date : String
        var isSelected: Bool = false
    }
    
}
//Areej
class ViewControllerSuccessScreen : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DDD")
    }
    
}

