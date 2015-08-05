//
//  HotelModel.swift
//  capitalist
//
//  Created by Brad on 7/22/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

class HotelModel:NSObject {
    var ID: Int {
        get {
            return Int(self.ID)
        }
        set {
            self.ID = newValue
        }
    }
    var name: String  {
        get {
            return String(self.name)
        }
        set {
            self.name = newValue
        }
    }
    var color: UIColor
    var activeFlag: Bool {
        get {
            return Bool(self.activeFlag)
        }
        set {
            self.activeFlag = newValue
        }
    }
    var listOfTiles: [TileModel] {
        get {
            return [TileModel](self.listOfTiles)
        }
        set {
            self.listOfTiles = newValue
        }
    }
    var safeFlag: Bool {
        get {
            return Bool(self.safeFlag)
        }
        set {
            self.safeFlag = newValue
        }
    }
    var stockPrice: Int {
        get {
            return Int(self.stockPrice)
        }
        set {
            self.stockPrice = newValue
        }
    }
    var majorityPayout: Int {
        get {
            return Int(self.majorityPayout)
        }
        set {
            self.majorityPayout = newValue
        }
    }
    var minorityPayout: Int {
        get {
            return Int(self.minorityPayout)
        }
        set {
            self.minorityPayout = newValue
        }
    }
    
    init(_ID:Int, _name:String, _color:UIColor, _stockPrice: Int) {
        self.color = whiteColor
        super.init()
        self.ID = _ID
        self.name = _name
        self.color = _color
        self.activeFlag = false
        self.safeFlag = false
        self.stockPrice = _stockPrice
        self.majorityPayout = _stockPrice * 10
        self.minorityPayout = majorityPayout / 2
    }
    
    func isActive(thisHotel: HotelModel) -> Bool{
        return thisHotel.activeFlag;
    }
    
    func calcStockPrice(thisHotel: HotelModel) -> Int{
        //Identify num of tiles using listOfTiles, then use InfoCard Model to match hotel and numTiles to Stock Price
        return thisHotel.stockPrice
    }
    
}