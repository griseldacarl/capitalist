//
//  Tile.swift
//  AcquirePlaybox
//
//  Created by Brad on 5/25/15.
//  Copyright (c) 2015 Brad Geren. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class Tile:SKSpriteNode {
    
    var image: String = ""
    var hotel: Hotel?
    var height: CGFloat = 0
    var width: CGFloat = 0
    var tileAbove:Tile?
    var tileBelow:Tile?
    var tileLeft:Tile?
    var tileRight:Tile?
    var owner:Int = 0
    var pos:CGPoint = CGPoint(x: 0, y: 0)
    var tileColor:UIColor = whiteColor
    var tileCornerTopLeft:Int = 0
    var tileCornerTopRight:Int = 11
    var tileCornerBottomLeft:Int = 96
    var tileCornerBottomRight:Int = 107
    
    init(tileWidth: CGFloat, tileHeight: CGFloat, tileSpacer: CGFloat, tilePos: CGPoint, beginHotel: Hotel) {
        let texture = SKTexture(imageNamed: "tile")
        let size = CGSizeMake(CGFloat(tileWidth),CGFloat(tileHeight))
        super.init(texture: texture, color: tileColor, size: size)
        self.height = tileHeight
        self.width = tileWidth
        self.pos = tilePos
        self.owner = 0
        self.hotel = beginHotel
    }
    
    func addNeighbors (currTile:Tile, currTileIndex:Int, numCols:Int) {
        //Setup 4 corners
        //Top Left Corner Tile (no tileAbove nor tileLeft)
        if currTileIndex == tileCornerTopLeft {
            currTile.tileAbove = Tiles[Tiles.endIndex - 2] //tileDummy1
            currTile.tileBelow = Tiles[currTileIndex + 12]
            currTile.tileLeft = Tiles[Tiles.endIndex - 1] //tileDummy2
            currTile.tileRight = Tiles[currTileIndex + 1]
        }
        //Top Right Corner Tile (no tileAbove nor tileRight)
        if currTileIndex == tileCornerTopRight {
            currTile.tileAbove = Tiles[Tiles.endIndex - 2] //tileDummy1
            currTile.tileBelow = Tiles[currTileIndex + 12]
            currTile.tileLeft = Tiles[currTileIndex - 1]
            currTile.tileRight = Tiles[Tiles.endIndex - 1] //tileDummy2
        }
        //Bottom Left Corner Tile (no tileBelow nor tileLeft)
        if currTileIndex == tileCornerBottomLeft {
            currTile.tileAbove = Tiles[currTileIndex - 12]
            currTile.tileBelow = Tiles[Tiles.endIndex - 2] //tileDummy1
            currTile.tileLeft = Tiles[Tiles.endIndex - 1] //tileDummy2
            currTile.tileRight = Tiles[currTileIndex + 1]        }
        //Bottom Right Corner Tile (no tileBelow nor tileRight)
        if currTileIndex == tileCornerBottomRight {
            currTile.tileAbove = Tiles[currTileIndex - 12]
            currTile.tileBelow = Tiles[Tiles.endIndex - 2] //tileDummy1
            currTile.tileLeft = Tiles[currTileIndex - 1]
            currTile.tileRight = Tiles[Tiles.endIndex - 1] //tileDummy2
        }
        
        //Setup all other tiles expect corners and dummies
        if ((currTileIndex != tileCornerTopLeft) && (currTileIndex != tileCornerTopRight) && (currTileIndex != tileCornerBottomLeft) && (currTileIndex != tileCornerBottomRight) && (currTile != Tiles[Tiles.endIndex - 1]) && currTile != Tiles[Tiles.endIndex - 2]) {
            if currTileIndex<12 {
                currTile.tileAbove = Tiles[Tiles.endIndex - 2] //tileDummy1
            }
            else {
                currTile.tileAbove = Tiles[currTileIndex - 12]
            }
            if currTileIndex>95 {
                currTile.tileBelow = Tiles[Tiles.endIndex - 2] //tileDummy1
            }
            else {
                currTile.tileBelow = Tiles[currTileIndex + 12]
            }
            if (currTileIndex % numCols)==0 {
                currTile.tileLeft = Tiles[Tiles.endIndex - 2] //tileDummy1
            }
            else {
                currTile.tileLeft = Tiles[currTileIndex - 1]
            }
            if (currTileIndex % numCols)==11 {
                currTile.tileRight = Tiles[Tiles.endIndex - 2] //tileDummy1
            }
            else {
                currTile.tileRight = Tiles[currTileIndex + 1]
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}