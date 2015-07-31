//
//  SettingsModel.swift
//  capitalist
//
//  Created by Carl Mitchell on 7/30/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

class SettingsModel:NSObject {
    var startingMoney: Int = 6000
    var numShares: Int = 25
    var mergerOrder: Int = 0
    var sharesPerTurn: Int = 3
    var numOfHotels: Int = 7
    var deadTilePolicy: Int = 0
    var endOfGamePolicy: Int = 0
    
    init(_startingMoney:Int, _numShares:Int, _mergerOrder:Int, _sharesPerTurn:Int, _numOfHotels:Int, _deadTilePolicy:Int, _endOfGamePolicy:Int) {
        self.startingMoney = _startingMoney
        self.numShares = _numShares
        self.mergerOrder = _mergerOrder
        self.sharesPerTurn = _sharesPerTurn
        self.numOfHotels = _numOfHotels
        self.deadTilePolicy = _deadTilePolicy
        self.endOfGamePolicy = _endOfGamePolicy
    }
}