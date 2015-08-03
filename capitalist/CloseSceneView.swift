//
//  CloseSceneView.swift
//  capitalist
//
//  Created by Carl Mitchell on 8/2/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit


class CloseSceneView: SKScene {
   
    var closeGameOverMessage: SKLabelNode = SKLabelNode(text: "Game Over")
    
    override init(size: CGSize){
        super.init(size: size)
        self.closeGameOverMessage.fontName  = "Chalkduster"
        self.closeGameOverMessage.fontColor = UIColor.redColor()
        self.closeGameOverMessage.fontSize = 48
        self.closeGameOverMessage.position =  CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.closeGameOverMessage.name="GameOver"
        
        self.addChild(self.closeGameOverMessage)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
