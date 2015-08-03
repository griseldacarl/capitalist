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
    
    var startButtonNode: SKLabelNode!
    var welcomeMessageNode: SKLabelNode!
    var threeplayerButtonNode: SKLabelNode!
    var fourplayerButtonNode: SKLabelNode!
    var fiveplayerButtonNode: SKLabelNode!
    var sixplayerButtonNode: SKLabelNode!
    
    
    
    override init(size: CGSize){
        super.init(size: size)
        
        self.anchorPoint = CGPointMake(0.5,0.5)
        self.scaleMode = SKSceneScaleMode.AspectFill
        self.backgroundColor = UIColor.clearColor()
    
        
        self.startButtonNode = SKLabelNode(text: "Start")
        self.startButtonNode.fontName  = "Chalkduster"
        self.startButtonNode.fontColor = UIColor.redColor()
        self.startButtonNode.fontSize = 48
        self.startButtonNode.position =  CGPointMake(0, -200)
        self.startButtonNode.name="start"
        
        let borderStartButtonNode: SKShapeNode = SKShapeNode(rect: CGRectMake(CGFloat(-125), CGFloat(-10), CGFloat(250), CGFloat(50)))
        borderStartButtonNode.strokeColor = UIColor.redColor()
        borderStartButtonNode.lineWidth = CGFloat(5.0)
        borderStartButtonNode.name = "start border"
        self.startButtonNode.addChild(borderStartButtonNode)
        self.addChild(startButtonNode)
        
        
        
        
        self.threeplayerButtonNode = SKLabelNode(text: "3 Players")
        self.threeplayerButtonNode.fontName  = "Chalkduster"
        self.threeplayerButtonNode.fontColor = UIColor.redColor()
        self.threeplayerButtonNode.fontSize = 48
        self.threeplayerButtonNode.position =  CGPoint(x:0,y: self.startButtonNode.position.y + 400)
        self.threeplayerButtonNode.name="threeplayer"
        
        
        let borderThreeplayerButtonNode: SKShapeNode = SKShapeNode(rect: CGRectMake(CGFloat(-125), CGFloat(-10), CGFloat(250), CGFloat(50)))
        borderThreeplayerButtonNode.strokeColor = UIColor.redColor()
        borderThreeplayerButtonNode.lineWidth = CGFloat(5.0)
        borderThreeplayerButtonNode.name = "Three Player border"
        self.threeplayerButtonNode.addChild(borderThreeplayerButtonNode)
        self.addChild(threeplayerButtonNode)
        
        
        self.fourplayerButtonNode = SKLabelNode(text: "4 Players")
        self.fourplayerButtonNode.fontName  = "Chalkduster"
        self.fourplayerButtonNode.fontColor = UIColor.redColor()
        self.fourplayerButtonNode.fontSize = 48
        self.fourplayerButtonNode.position =  CGPoint(x:0, y:self.startButtonNode.position.y + 300)
        self.fourplayerButtonNode.name="fourplayer"
        
        let borderFourplayerButtonNode: SKShapeNode = SKShapeNode(rect: CGRectMake(CGFloat(-125), CGFloat(-10), CGFloat(250), CGFloat(50)))
        borderFourplayerButtonNode.strokeColor = UIColor.redColor()
        borderFourplayerButtonNode.lineWidth = CGFloat(5.0)
        borderFourplayerButtonNode.name = "Four Player border"
        self.fourplayerButtonNode.addChild(borderFourplayerButtonNode)
        self.addChild(fourplayerButtonNode)
        
        self.fiveplayerButtonNode = SKLabelNode(text: "5 Players")
        self.fiveplayerButtonNode.fontName  = "Chalkduster"
        self.fiveplayerButtonNode.fontColor = UIColor.redColor()
        self.fiveplayerButtonNode.fontSize = 48
        self.fiveplayerButtonNode.position =  CGPoint(x:0, y:0)
        self.fiveplayerButtonNode.name="fiveplayer"
        
        let borderFiveplayerButtonNode: SKShapeNode = SKShapeNode(rect: CGRectMake(CGFloat(-125), CGFloat(-10), CGFloat(250), CGFloat(50)))
        borderFiveplayerButtonNode.strokeColor = UIColor.redColor()
        borderFiveplayerButtonNode.lineWidth = CGFloat(5.0)
        borderFiveplayerButtonNode.name = "Five Player border"
        self.fiveplayerButtonNode.addChild(borderFiveplayerButtonNode)
        self.addChild(fiveplayerButtonNode)
        
        self.sixplayerButtonNode = SKLabelNode(text: "6 Players")
        self.sixplayerButtonNode.fontName  = "Chalkduster"
        self.sixplayerButtonNode.fontColor = UIColor.redColor()
        self.sixplayerButtonNode.fontSize = 48
        self.sixplayerButtonNode.position =  CGPoint(x:0, y:self.startButtonNode.position.y + 100)
        self.sixplayerButtonNode.name = "sixplayer"
        
        let borderSixplayerButtonNode: SKShapeNode = SKShapeNode(rect: CGRectMake(CGFloat(-125), CGFloat(-10), CGFloat(250), CGFloat(50)))
        borderSixplayerButtonNode.strokeColor = UIColor.redColor()
        borderSixplayerButtonNode.lineWidth = CGFloat(5.0)
        borderSixplayerButtonNode.name = "Six Player border"
        self.sixplayerButtonNode.addChild(borderSixplayerButtonNode)
        self.addChild(sixplayerButtonNode)
        
        
        self.welcomeMessageNode = SKLabelNode(text: "Capitalist: A game based on Acquire!")
        self.welcomeMessageNode.fontName = "Chalkduster"
        self.welcomeMessageNode.fontColor = UIColor.whiteColor()
        self.welcomeMessageNode.fontSize = 48
        self.welcomeMessageNode.name  = "welcomemessage"
        self.welcomeMessageNode.position = CGPoint(x: 0, y: self.startButtonNode.position.y + 500)
        self.addChild(welcomeMessageNode)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateView", name: "GameSceneModelAndSequencer", object: nil)
        
    
    }
    
     func updateView(){ println ("Welcome Screen was Updated!")}

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        let touch = touches.first as? UITouch
        let location = touch?.locationInNode(self)
        let node:SKNode = nodeAtPoint(location!)
        
        
        if self.threeplayerButtonNode.containsPoint(location!){
            println("You have tap 3 players node!")
            NSNotificationCenter.defaultCenter().postNotificationName("3Players", object: self, userInfo: nil)
            
        }

        if self.fourplayerButtonNode.containsPoint(location!){
            println("You have tap 4 players!")
            NSNotificationCenter.defaultCenter().postNotificationName("4Players", object: self, userInfo: nil)
            
        }
        
        if self.fiveplayerButtonNode.containsPoint(location!){
            println("You have tap 5 players!")
            NSNotificationCenter.defaultCenter().postNotificationName("5Players", object: self, userInfo: nil)
            
        }
        
        if self.sixplayerButtonNode.containsPoint(location!){
            println("You have tap 6 players!")
            NSNotificationCenter.defaultCenter().postNotificationName("6Players", object: self, userInfo: nil)
            
        }
        
        if self.startButtonNode.containsPoint(location!){
            println("You have tap start button!")
            NSNotificationCenter.defaultCenter().postNotificationName("StartButton", object: self, userInfo: nil)
            
        }
        
    }
  
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
