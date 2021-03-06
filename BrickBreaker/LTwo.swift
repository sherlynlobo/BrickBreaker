//
//  LTwo.swift
//  BrickBreaker
//
//  Created by Sherlyn Lobo on 2019-02-23.
//  Copyright © 2019 Sherlyn Lobo. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation




class LTwo: SKScene, SKPhysicsContactDelegate {
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!
    
    
    var audioPlayer:AVAudioPlayer!
    
    
    override func didMove(to view: SKView) {
        
        
        //For Background Music
        let backgroundSound = SKAudioNode(fileNamed: "background_music.mp3")
        self.addChild(backgroundSound)
        
        ball = (self.childNode(withName: "Ball") as! SKSpriteNode)
        paddle = (self.childNode(withName: "Paddle") as! SKSpriteNode)
        scoreLabel = self.childNode(withName: "Score") as?  SKLabelNode
        
        let urlPath = Bundle.main.url(forResource: "brick", withExtension: "wav")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: urlPath!)
            audioPlayer.prepareToPlay()
            //to check if audio file works
            if (audioPlayer != nil) {
                print("Contains a value!")
            } else {
                print("Doesn’t contain a value.")
            }
        } catch{
            print("Error")
        }
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 200, dy: 200) )
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
                audioPlayer.play()
                contact.bodyA.node?.removeFromParent()
                score += 1
            } else if bodyBName == "bricks" {
                audioPlayer.play()
                contact.bodyB.node?.removeFromParent()
                score += 1
            }
        }
        
    }
    override func update(_ currentTime: TimeInterval) {
        //Winning Logic
        if (score == 24)
        {
            if let go = Menu(fileNamed: "LThree")  {
                go.scaleMode = .aspectFill
                view!.presentScene(go)
            }
        }
        //Losing Logic
        if (ball.position.y < paddle.position.y)
        {
            if let go = Menu(fileNamed: "GameOver")  {
                go.scaleMode = .aspectFill
                view!.presentScene(go)
            }
            //scoreLabel.text = "You Lost!"
            
            //self.view?.isPaused = true
            
        }
    }
    
}
