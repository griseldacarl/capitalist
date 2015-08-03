//
//  GameSceneModelAndSequencer.swift
//  capitalist
//
//  Created by Carl Mitchell on 7/30/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit
public struct InfoCardPosition{
    public var infoCardPositionX: Float = 0.0
    public var infocardPositionY: Float = 0.0
}

public struct StockScoreBoardPosition{
    public var stockScoreBoardPositionX: Float = 0.0
    public var stockScoreBoardPositionY: Float = 0.0
}

public struct MoneyPosition{
    public var moneyPositionX: Float  = 0.0
    public var moneyPositionY: Float = 0.0
}

public struct GameBoardPosition{
    public var gameboardPositionX: Float  = 0.0
    public var gameboardPositionY: Float = 0.0
    
}

public class GameSceneModelAndSequencer : NSObject {

    var  numberOfPlayers: Int = 0
    
    var infoCardLocation: InfoCardPosition = InfoCardPosition()
    var stockScoreBoardLocation:StockScoreBoardPosition = StockScoreBoardPosition()
    var moneyLocation: MoneyPosition = MoneyPosition()
    var gameboardLocation: GameBoardPosition = GameBoardPosition()
    


    public func setNumberOfPlayersWithNotification(players: Int){
         numberOfPlayers = players
         notifyViews()
    }
    public func notifyViews(){
        NSNotificationCenter.defaultCenter().postNotificationName("GameSceneModelAndSequencer", object: self, userInfo: nil)
    }
}
 