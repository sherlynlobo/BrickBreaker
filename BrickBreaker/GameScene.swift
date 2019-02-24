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
    
    
    
   // var newGameButtonNode :SKSpriteNode!
    
    public static var NG:SKLabelNode = SKLabelNode(text: "New Game")

    //var instructionsNode:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
//        newGameButtonNode.name = "ng"
        
        Menu.NG.position.x = 0
        Menu.NG.position.y = 0
        
        Menu.NG.fontColor = UIColor.yellow
        Menu.NG.fontSize = 40.0
        Menu.NG.zPosition = 3
        Menu.NG.fontName = "Arial Bold"
        Menu.NG.name = "NG"
        
        addChild(Menu.NG)
    
        
    }
    
 

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "NG" {
                /*
                 let newScene = GameScene(size: self.size)
                 newScene.scaleMode = self.scaleMode
                 let transitionEffect = SKTransition.fade(withDuration: 0.5)
                 self.view!.presentScene(newScene, transition: transitionEffect)*/
                
                if let go = GameScene(fileNamed: "Game")  {
                    go.scaleMode = .aspectFill
                    view!.presentScene(go)
                }

                
            }
            
        }
        
    }
    
}

