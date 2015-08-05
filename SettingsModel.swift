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
    var startingMoney: Int {
        get {
            return Int(self.startingMoney)
        }
        set {
            self.startingMoney = newValue
        }
    }
    var numShares: Int {
        get {
            return Int(self.numShares)
        }
        set {
            self.numShares = newValue
        }
    }
    var mergerOrder: Int {
        get {
            return Int(self.mergerOrder)
        }
        set {
            self.mergerOrder = newValue
        }
    }
    var sharesPerTurn: Int {
        get {
            return Int(self.sharesPerTurn)
        }
        set {
            self.sharesPerTurn = newValue
        }
    }
    var numOfHotels: Int {
        get {
            return Int(self.numOfHotels)
        }
        set {
            self.numOfHotels = newValue
        }
    }
    var deadTilePolicy: Int {
        get {
            return Int (self.deadTilePolicy)
        }
        set {
            self.deadTilePolicy = newValue
        }
    }
    var endOfGamePolicy: Int {
        get {
            return Int(self.endOfGamePolicy)
        }
        set {
            self.endOfGamePolicy = newValue
        }
    }
    
    init(_startingMoney:Int, _numShares:Int, _mergerOrder:Int, _sharesPerTurn:Int, _numOfHotels:Int, _deadTilePolicy:Int, _endOfGamePolicy:Int) {
        super.init()
        self.startingMoney = _startingMoney
        self.numShares = _numShares
        self.mergerOrder = _mergerOrder
        self.sharesPerTurn = _sharesPerTurn
        self.numOfHotels = _numOfHotels
        self.deadTilePolicy = _deadTilePolicy
        self.endOfGamePolicy = _endOfGamePolicy
    }
}