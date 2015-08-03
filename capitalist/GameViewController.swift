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
    
    let modelGameScene = GameSceneModelAndSequencer()
    let PlayersToBe3 = 3
    let PlayersToBe4 = 4
    let PlayersToBe5 = 5
    let PlayersToBe6 = 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.dae")!
       
        
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the ship node
        let ship = scene.rootNode.childNodeWithName("ship", recursively: true)!
        
        // animate the 3d object
        ship.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 2, z: 0, duration: 1)))
        let scnView = self.view as! SCNView
        
        
        // set the scene to the view
        scnView.scene = scene
        
        
    
        
        // add a tap gesture recognizer
    /*    let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        var gestureRecognizers = [AnyObject]()
        gestureRecognizers.append(tapGesture)
        if let existingGestureRecognizers = scnView.gestureRecognizers {
            gestureRecognizers.extend(existingGestureRecognizers)
        }
        scnView.gestureRecognizers = gestureRecognizers
  */
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
    
    func handleTap(gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.locationInView(scnView)
        if let hitResults = scnView.hitTest(p, options: nil) {
            // check that we clicked on at least one object
            if hitResults.count > 0 {
                // retrieved the first clicked object
                let result: AnyObject! = hitResults[0]
                
               
                // get its material
                let material = result.node!.geometry!.firstMaterial!
                
                // highlight it
                SCNTransaction.begin()
                SCNTransaction.setAnimationDuration(0.5)
                
                // on completion - unhighlight
                SCNTransaction.setCompletionBlock {
                    SCNTransaction.begin()
                    SCNTransaction.setAnimationDuration(0.5)
                    
                    material.emission.contents = UIColor.blackColor()
                    
                    SCNTransaction.commit()
                }
                
                material.emission.contents = UIColor.redColor()
                
                SCNTransaction.commit()
            }
        }
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
