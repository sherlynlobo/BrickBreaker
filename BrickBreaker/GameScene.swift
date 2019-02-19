//
//  GameScene.swift
//  BrickBreaker
//
//  Created by Sherlyn Lobo on 2019-02-14.
//  Copyright © 2019 Sherlyn Lobo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!
    var scoreLabel:SKLabelNode!
    var score:Int = 0{
        didSet
        {
            scoreLabel.text = "Score:\(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        
        ball = (self.childNode(withName: "Ball") as! SKSpriteNode)
        paddle = (self.childNode(withName: "Paddle") as! SKSpriteNode)
        
        scoreLabel = self.childNode(withName: "Score") as!  SKLabelNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50) )
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        self.physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name
        
        if bodyAName == "Ball" && bodyBName == "bricks" || bodyAName == "bricks" && bodyBName == "Ball"{
            if bodyAName == "bricks" {
                contact.bodyA.node?.removeFromParent()
                score += 1
            } else if bodyBName == "bricks" {
                contact.bodyB.node?.removeFromParent()
                score += 1
            }
        }

    }
    override func update(_ currentTime: TimeInterval) {
        //Winning Logic
        if (score == 12)
        {
        scoreLabel.text = "YOU WON!"
        self.view?.isPaused = true
        }
    }
    
    
}
