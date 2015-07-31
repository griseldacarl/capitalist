//
//  InfoCardModel.swift
//  capitalist
//
//  Created by Carl Mitchell on 7/30/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

class InfoCardModel:NSObject {
    var hotelID: Int
    var minNumTiles: Int
    var maxNumTiles: Int
    var shareCost: Int
    var majorityPayout: Int
    var minorityPayout: Int
    
    init(_hotelID:Int, _minNumTiles:Int, _maxNumTiles:Int, _shareCost:Int, _majorityPayout:Int, _minorityPayout:Int) {
        self.hotelID = _hotelID
        self.minNumTiles = _minNumTiles
        self.maxNumTiles = _maxNumTiles
        self.shareCost = _shareCost
        self.majorityPayout = _majorityPayout
        self.minorityPayout = _minorityPayout
    }
    
}