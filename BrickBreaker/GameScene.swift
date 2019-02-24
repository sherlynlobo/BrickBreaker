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
    public static var IT:SKLabelNode = SKLabelNode(text: "Instructions")

    //var instructionsNode:SKSpriteNode!
    
    override func didMove(to view: SKView) {
        //newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
//        newGameButtonNode.name = "ng"
        
        Menu.NG.position.x = 0
        Menu.NG.position.y = 0
        
        Menu.NG.fontColor = UIColor.yellow
        Menu.NG.fontSize = 72.0
        Menu.NG.zPosition = 3
        Menu.NG.fontName = "Arial Bold"
        Menu.NG.name = "NG"
        
        addChild(Menu.NG)
        
        Menu.IT.position.x = 0
        Menu.IT.position.y = -200
        
        Menu.IT.fontColor = UIColor.yellow
        Menu.IT.fontSize = 72.0
        Menu.IT.zPosition = 3
        Menu.IT.fontName = "Arial Bold"
        Menu.IT.name = "IT"
        
        addChild(Menu.IT)
    
        
    }
    
 

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            
            if tappedNode.name == "NG" {
                
                if let go = GameScene(fileNamed: "Game")  {
                    go.scaleMode = .aspectFill
                    view!.presentScene(go)
                }
            }
            else if tappedNode.name == "IT" {
                
                if let go = Menu(fileNamed: "Instructions")  {
                    go.scaleMode = .aspectFill
                    view!.presentScene(go)
                }
            }
            
        }
        
    }
    
}

