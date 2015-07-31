//
//  PlayerModel.swift
//  capitalist
//
//  Created by Brad on 7/30/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

class PlayerModel:NSObject {
    var ID: Int
    var name: String
    var balance: Int = 0
    var image: String = ""
    
    init(_ID:Int, _name:String, _image:String) {
        self.ID = _ID
        self.name = _name
        self.image = _image
    }
    
    func withdrawPayment(thisPlayer: PlayerModel, withdrawAmt: Int){
        thisPlayer.balance = thisPlayer.balance - withdrawAmt
    }
    
    func depositPayment(thisPlayer: PlayerModel, depositAmt: Int){
        thisPlayer.balance = thisPlayer.balance - depositAmt
    }
    
}