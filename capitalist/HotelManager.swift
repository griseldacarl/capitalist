//
//  HotelManager.swift
//  capitalist
//
//  Created by Brad on 7/31/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

let whiteColor:UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
let yellowColor:UIColor = UIColor(red: 255/255, green: 255/255, blue: 0, alpha: 1)
let redColor:UIColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
let blueColor:UIColor = UIColor(red: 0, green: 0, blue: 255/255, alpha: 1)
let brownColor:UIColor = UIColor(red: 222/255, green: 185/255, blue: 135/255, alpha: 1)
let greenColor:UIColor = UIColor(red: 0, green: 255/255, blue: 0, alpha: 1)
let pinkColor:UIColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
let cyanColor:UIColor = UIColor(red: 0, green: 255/255, blue: 255/255, alpha: 1)
let greyColor:UIColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
let blackColor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

class HotelManager:NSObject {
    var listOfHotels: [HotelModel] = []
    
    
    func createHotels() {
        var hotel = HotelModel(_ID: 0, _name: "Tower", _color: yellowColor, _stockPrice: 200)
        listOfHotels.append(hotel)
        hotel = HotelModel(_ID: 1, _name: "Luxor", _color: redColor, _stockPrice: 200)
        listOfHotels.append(hotel)
        hotel = HotelModel(_ID: 2, _name: "American", _color: blueColor, _stockPrice: 300)
        listOfHotels.append(hotel)
        hotel = HotelModel(_ID: 3, _name: "Worldwide", _color: brownColor, _stockPrice: 300)
        listOfHotels.append(hotel)
        hotel = HotelModel(_ID: 4, _name: "Festival", _color: greenColor, _stockPrice: 300)
        listOfHotels.append(hotel)
        hotel = HotelModel(_ID: 5, _name: "Imperial", _color: pinkColor, _stockPrice: 400)
        listOfHotels.append(hotel)
        hotel = HotelModel(_ID: 6, _name: "Continental", _color: cyanColor, _stockPrice: 400)
        listOfHotels.append(hotel)
    }
    
}