//
//  WelcomeScreenAquire.swift
//  capitalist
//
//  Created by Carl Mitchell on 7/27/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import UIKit
import SpriteKit

class WelcomeScreenAquireView: SKScene {
    
    var startButtonNode: SKSpriteNode!
    var welcomeMessageNode: SKLabelNode!
    var threeplayerButtonNode: SKSpriteNode!
    var fourplayerButtonNode: SKSpriteNode!
    var fiveplayerButtonNode: SKSpriteNode!
    var sixplayerButtonNode: SKSpriteNode!
    
    
    
    override init(size: CGSize){
        super.init(size: size)
        
        self.anchorPoint = CGPointMake(0.5,0.5)
        self.scaleMode = SKSceneScaleMode.ResizeFill
        self.backgroundColor = UIColor.clearColor()
    
        let spriteSize = size.width/2
        self.startButtonNode = SKSpriteNode(imageNamed: "startButton")
        self.startButtonNode.size = CGSize(width: spriteSize, height: spriteSize)
        self.startButtonNode.position =  CGPointMake(0, -200)
        self.addChild(startButtonNode)
        
        self.threeplayerButtonNode = SKSpriteNode(imageNamed: "3player")
        self.threeplayerButtonNode.size = CGSize(width: spriteSize, height: spriteSize/2)
        self.threeplayerButtonNode.position =  CGPointMake(0,self.startButtonNode.position.y + 400)
        self.addChild(threeplayerButtonNode)
        
        self.fourplayerButtonNode = SKSpriteNode(imageNamed: "4player")
        self.fourplayerButtonNode.size = CGSize(width: spriteSize, height: spriteSize/2)
        self.fourplayerButtonNode.position =  CGPointMake(0,self.startButtonNode.position.y + 300)
        self.addChild(fourplayerButtonNode)
        
        self.fiveplayerButtonNode = SKSpriteNode(imageNamed: "5player")
        self.fiveplayerButtonNode.size = CGSize(width: spriteSize, height: spriteSize/2)
        self.fiveplayerButtonNode.position =  CGPointMake(0,self.startButtonNode.position.y + 200)
        self.addChild(fiveplayerButtonNode)
        
        self.sixplayerButtonNode = SKSpriteNode(imageNamed: "6player")
        self.sixplayerButtonNode.size = CGSize(width: spriteSize, height: spriteSize/2)
        self.sixplayerButtonNode.position =  CGPointMake(0,self.startButtonNode.position.y + 100)
        self.addChild(sixplayerButtonNode)
        
        
        self.welcomeMessageNode = SKLabelNode(text: "Capitalist: A game based on Acquire!")
        self.welcomeMessageNode.fontName = "DINAlternate-Bold"
        self.welcomeMessageNode.fontColor = UIColor.whiteColor()
        self.welcomeMessageNode.fontSize = 48
        self.welcomeMessageNode.position = CGPoint(x: 0, y: self.startButtonNode.position.y + 500)
        self.addChild(welcomeMessageNode)
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
