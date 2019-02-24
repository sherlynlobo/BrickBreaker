//
//  GameScene.swift
//  BrickBreaker
//
//  Created by Sherlyn Lobo on 2019-02-14.
//  Copyright © 2019 Sherlyn Lobo. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

var scoreLabel:SKLabelNode!
var score:Int = 0{
    didSet
    {
        scoreLabel.text = "Score:\(score)"
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!

    
    var audioPlayer:AVAudioPlayer!

    
    override func didMove(to view: SKView) {
        
        if let menu = Menu(fileNamed: "Menu")  {
            menu.scaleMode = .aspectFill
            view.presentScene(menu)
        }
        /*
        if let skView = self.view as? SKView {
            
            if skView.scene == nil {
                
                let scene = Menu(size: skView.bounds.size)
                scene.scaleMode = .aspectFill
                skView.presentScene(scene)
            }
        }*/
        
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
        if (score == 12)
        {
        scoreLabel.text = "YOU WON!"
        self.view?.isPaused = true
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
    
    

