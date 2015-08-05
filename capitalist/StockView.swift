//
//  StockView.swift
//  capitalist
//
//  Created by Carl Mitchell on 8/2/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import UIKit
import SpriteKit

class StockView: SKShapeNode {
    override init(){
        super.init()
        
        var rect = CGRect(origin: CGPointZero, size: CGSize(width: 200, height: 400))
        
        self.position = CGPointMake(CGRectGetMidX(self.frame)+300, CGRectGetMidY(self.frame))
        
        self.path = CGPathCreateWithRect(rect, nil)
        self.lineWidth = 3
        self.strokeColor = UIColor.redColor()
        self.fillColor = UIColor.yellowColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
