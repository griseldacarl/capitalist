//
//  TileModel.swift
//  capitalist
//
//  Created by Brad on 7/20/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

let whiteColor:UIColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
let yellowColor:UIColor = UIColor(red: 255/255, green: 255/255, blue: 0, alpha: 1)
let redColor:UIColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
let blueColor:UIColor = UIColor(red: 0, green: 0, blue: 255/255, alpha: 1)
let brownColor:UIColor = UIColor(red: 222/255, green: 185/255, blue: 135/255, alpha: 1)
let greenColor:UIColor = UIColor(red: 0, green: 255/255, blue: 0, alpha: 1)
let pinkColor:UIColor = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
let cyanColor:UIColor = UIColor(red: 0, green: 255/255, blue: 255/255, alpha: 1)
let greyColor:UIColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
let blackColor:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
let tileCornerTopLeft:Int = 0
let tileCornerTopRight:Int = 11
let tileCornerBottomLeft:Int = 96
let tileCornerBottomRight:Int = 107


class TileModel:NSObject {

    var name:String = ""
    var image:String = ""
    var width:CGFloat
    var height:CGFloat
    var size:CGSize
    var position:CGPoint = CGPoint(x: 0, y: 0)
    var owner:Int = 0
    var label:String = ""
    var color:UIColor = whiteColor
    var tileAbove:TileModel?
    var tileBelow:TileModel?
    var tileLeft:TileModel?
    var tileRight:TileModel?
    
    init(_label: String, _width: CGFloat, _height: CGFloat, tileSpacer: CGFloat, _position: CGPoint) {
        self.label = _label
        self.size = CGSizeMake(CGFloat(_width),CGFloat(_height))
        self.height = _height
        self.width = _width
        self.position = _position
    }
    
    func changeTileColor(color:UIColor, thisTile:TileModel) {
        thisTile.color = color
    }
    
    func changeOwner(thisTile: TileModel, ownerName: String) {
        switch ownerName {
        case "Player":
            thisTile.owner = 1
        case "Board":
            thisTile.owner = 2
        case "Hotel":
            thisTile.owner = 3
        default:
            thisTile.owner = 0
        }
    }
    
    func isPicked(thisTile: TileModel) -> Bool{
        if thisTile.owner != 0 {
            return true;
        }
        else {
            return false;
        }
    }
    
    func isOwnedByPlayer(thisTile: TileModel) -> Bool{
        if thisTile.owner == 1 {
            return true;
        }
        else {
            return false;
        }
    }
    
    func isOwnedByBoard(thisTile: TileModel) -> Bool{
        if thisTile.owner == 2 {
            return true;
        }
        else {
            return false;
        }
    }
    
    func isOwnedByHotel(thisTile: TileModel) -> Bool{
        if thisTile.owner == 3 {
            return true;
        }
        else {
            return false;
        }
    }
    
    func addNeighbors (Tiles:[TileModel], currTile:TileModel, currTileIndex:Int, numCols:Int) {
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
    
}