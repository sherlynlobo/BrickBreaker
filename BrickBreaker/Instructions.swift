//
//  Instructions.swift
//  BrickBreaker
//
//  Created by Sherlyn Lobo on 2019-02-23.
//  Copyright © 2019 Sherlyn Lobo. All rights reserved.
//

import Foundation

import SpriteKit
import GameplayKit
import AVFoundation
class Instructions: SKScene {
    
    
    
    // var newGameButtonNode :SKSpriteNode!
    
    public static var back:SKLabelNode = SKLabelNode(text: "Back")
    
    //var instructionsNode:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
        //        newGameButtonNode.name = "ng"
        
        Instructions.back.position.x = 0
        Instructions.back.position.y = -250
        
        Instructions.back.fontColor = UIColor.yellow
        Instructions.back.fontSize = 40.0
        Instructions.back.zPosition = 3
        Instructions.back.fontName = "Arial Bold"
        Instructions.back.name = "Back"
        addChild(Instructions.back)
        
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "Back" {
                /*
                 let newScene = GameScene(size: self.size)
                 newScene.scaleMode = self.scaleMode
                 let transitionEffect = SKTransition.fade(withDuration: 0.5)
                 self.view!.presentScene(newScene, transition: transitionEffect)*/
                
                if let go = Instructions(fileNamed: "GameScene")  {
                    go.scaleMode = .aspectFill
                    view!.presentScene(go)
                }
                
                
            }
            
        }
        
    }
    
}


