//
//  GameSceneView.swift
//  capitalist
//
//  Created by Carl Mitchell on 7/30/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit

class GameSceneView: SKScene {
 
    let infocard: InfoCardView=InfoCardView()
    let stock: StockView = StockView()
    
    override init(size: CGSize){
        super.init(size: size)
        self.addChild(infocard)
        self.addChild(stock)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateView", name: "GameSceneModelAndSequencer", object: nil)
    }
    
     func updateView(){
      println ("GameSceneView was updated!")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
