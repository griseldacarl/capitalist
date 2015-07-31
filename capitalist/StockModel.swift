//
//  StockModel.swift
//  capitalist
//
//  Created by Brad on 7/30/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

class StockModel:NSObject {
    var ID: Int
    var hotelID: Int = 0
    var ownerID: Int = 0
    var image: String = ""
    var size:CGSize
    
    init(_ID:Int, _hotelID:Int, _ownerID:Int, _image:String, _size:CGSize) {
        self.ID = _ID
        self.hotelID = _hotelID
        self.ownerID = _ownerID
        self.image = _image
        self.size = _size
    }
    
}