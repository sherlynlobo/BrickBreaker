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
    
    
    override func didMove(to view: SKView) {
        
        GameOver.scoreLabel = self.childNode(withName: "scorelabel") as! SKLabelNode
        GameOver.scoreLabel.text = ""
        
        GameOver.scoreLabel.text = String(score)
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
    }
    
}




