//
//  Menu.swift
//  BrickBreaker
//
//  Created by Sherlyn Lobo on 2019-02-23.
//  Copyright © 2019 Sherlyn Lobo. All rights reserved.
//


import SpriteKit
import GameplayKit
import AVFoundation
class Menu: SKScene {
    
    
    
    var newGameButtonNode :SKSpriteNode!
    var instructionsNode:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
        newGameButtonNode.name = "ng"
        
    }
    
 

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "ng" {
                
                let newScene = GameScene(size: self.size)
                newScene.scaleMode = self.scaleMode
               let transitionEffect = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(newScene, transition: transitionEffect)
                
            }
            
        }
        
    }
    
}

