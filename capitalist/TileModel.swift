//
//  TileModel.swift
//  capitalist
//
//  Created by Brad on 7/20/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import Foundation
import UIKit

let tileCornerTopLeft:Int = 0
let tileCornerTopRight:Int = 11
let tileCornerBottomLeft:Int = 96
let tileCornerBottomRight:Int = 107


class TileModel:NSObject {

    var name:String {
        return String(name)
        }
    var image:String {
        get {
            return String(self.image)
        }
        set {
            self.image = newValue
        }
    }
    var width:CGFloat {
        get {
            return CGFloat(self.width)
        }
        set {
            self.width = newValue
        }
    }
    var height:CGFloat {
        get {
            return CGFloat(self.height)
        }
        set {
            self.height = newValue
        }
    }
    var size:CGSize {
        get {
            return CGSize(width: self.size.width, height: self.size.height)
        }
        set {
            self.size = newValue
        }
    }
    var position:CGPoint {
        get {
            return CGPoint(x: self.position.x, y: self.position.y)
        }
        set {
            self.position = newValue
        }
    }
    var owner:Int {
        get {
            return Int(self.owner)
        }
        set {
            self.owner = newValue
        }
    }
    var label:String {
        get {
            return String(self.label)
        }
        set {
            self.label = newValue
        }
    }
    var color:UIColor = whiteColor
    var tileAbove:TileModel? {
        get {
            return TileModel(self.tileAbove)
        }
        set {
            self.tileAbove = newValue
        }
    }
    var tileBelow:TileModel? {
        get {
            return TileModel(self.tileBelow)
        }
        set {
            self.tileBelow = newValue
        }
    }
    var tileLeft:TileModel? {
        get {
            return TileModel(self.tileLeft)
        }
        set {
            self.tileLeft = newValue
        }
    }
    var tileRight:TileModel? {
        get {
            return TileModel(self.tileRight)
        }
        set {
            self.tileRight = newValue
        }
    }
    
    init(_label: String, _width: CGFloat, _height: CGFloat, tileSpacer: CGFloat, _position: CGPoint) {
        super.init()
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