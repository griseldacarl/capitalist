//
//  GameViewController.swift
//  capitalist
//
//  Created by Carl Mitchell on 7/20/15.
//  Copyright (c) 2015 Carl Mitchell. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit


class GameViewController: UIViewController {

    var overlaySceneWelcome: WelcomeScreenAquireView!
    var overlaySceneClose: CloseSceneView!
    var overlaySceneGame: GameSceneView!
    var gameBoard: SCNScene!
    
    
    let modelGameScene = GameSceneModelAndSequencer()
    let PlayersToBe3 = 3
    let PlayersToBe4 = 4
    let PlayersToBe5 = 5
    let PlayersToBe6 = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "gameboard.scnassets/gameboard.dae")!
        //let scene = SCNScene()
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        scene.rootNode.addChildNode(cameraNode)
        
//        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
//        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeSpot
        lightNode.light!.spotInnerAngle = 30.0
        lightNode.light!.spotOuterAngle = 80.0
        lightNode.position = SCNVector3(x: 0, y: 0, z: 20)
        scene.rootNode.addChildNode(lightNode)
//
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.whiteColor()
        scene.rootNode.addChildNode(ambientLightNode)
//
        //let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        //let boxNode = SCNNode(geometry: boxGeometry)
        //scene.rootNode.addChildNode(boxNode)
        
        // retrieve the ship node
      //  let ship = scene.rootNode.childNodeWithName("Plane_001", recursively: true)!
        
        // animate the 3d object
       // ship.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 2, z: 0, duration: 1)))
       
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.cyanColor()
        
        
        
       
  }
    override func viewWillLayoutSubviews() {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        if(scnView.scene != nil){
        
        //Add the overlayScene
        self.overlaySceneWelcome  =  WelcomeScreenAquireView(size: scnView.bounds.size)
        self.overlaySceneWelcome.name="WelcomeScreenAquireView";
        scnView.overlaySKScene = overlaySceneWelcome
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.blackColor()
        }
    }
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "set3Players", name: "3Players", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "set4Players", name: "4Players", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "set5Players", name: "5Players", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "set6Players", name: "6Players", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "doStart", name: "StartButton", object: nil)
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "3Players", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "4Players", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "5Players", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "6Players", object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "StartButton", object: nil)
    }
    
    func set3Players(){
       println("Player : 3Players")
        modelGameScene.setNumberOfPlayersWithNotification(self.PlayersToBe3)
    }
    
    func set4Players(){
        println("Player : 4 Players")
        modelGameScene.setNumberOfPlayersWithNotification(self.PlayersToBe4)
    }
    
    func set5Players(){
        println("Player : 5 Players")
        modelGameScene.setNumberOfPlayersWithNotification(self.PlayersToBe6)
    }
    
    func set6Players(){
        println("Player : 6 Players")
        modelGameScene.setNumberOfPlayersWithNotification(self.PlayersToBe6)
    }
    
    func doStart()
    {
        println("Player : start")
        let scnView = self.view as! SCNView
        self.overlaySceneWelcome.hidden = true
        self.overlaySceneGame = GameSceneView(size: self.view.bounds.size)
        scnView.overlaySKScene = self.overlaySceneGame
        
    }
   
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
