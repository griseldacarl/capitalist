//
//  HotelModel.swift
//  capitalist
//
//  Created by Brad on 7/22/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

class Hotel:NSObject {
    var ID: Int
    var name: String
    var color: UIColor
    var activeFlag: Bool
    var listOfTiles: [Tile] = []
    var safeFlag: Bool
    var stockPrice: Int
    var majorityPayout: Int
    var minorityPayout: Int
    
    init(_ID:Int, _name:String, _color:UIColor, _stockPrice: Int, _majorityPayout: Int, _minorityPayout: Int) {
        self.ID = _ID
        self.name = _name
        self.color = _color
        self.activeFlag = false
        self.safeFlag = false
        self.stockPrice = _stockPrice
        self.majorityPayout = _majorityPayout
        self.minorityPayout = _minorityPayout
    }
}