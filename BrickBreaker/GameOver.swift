//
//  GameOver.swift
//  BrickBreaker
//
//  Created by Sherlyn Lobo on 2019-02-23.
//  Copyright © 2019 Sherlyn Lobo. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation
class GameOver: SKScene {

     public static var scoreLabel:SKLabelNode = SKLabelNode(text: "")
    
     public static var GO:SKLabelNode = SKLabelNode(text: "Game Over")
    

        
   
    
    override func didMove(to view: SKView) {
        
        GameOver.scoreLabel = self.childNode(withName: "scorelabel") as! SKLabelNode
        GameOver.scoreLabel.text = ""
        
        GameOver.scoreLabel.text = String(score)
        
        
        GameOver.GO.position.x = 0
        GameOver.GO.position.y = 0
        
        GameOver.GO.fontColor = UIColor.yellow
        GameOver.GO.fontSize = 40.0
        GameOver.GO.zPosition = 3
        GameOver.GO.fontName = "Arial Bold"
        GameOver.GO.name = "GO"
        
        addChild(GameOver.GO)
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "GO" {
                /*
                let newScene = GameScene(size: self.size)
                newScene.scaleMode = self.scaleMode
                let transitionEffect = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(newScene, transition: transitionEffect)*/
                
                if let go = Menu(fileNamed: "GameScene")  {
                    go.scaleMode = .aspectFill
                    view!.presentScene(go)
                }
            }
            
        }
 
       
        

        
        
    }
    
}




