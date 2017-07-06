//
//  VolleygameSC.swift
//  volleyGame
//
//  Created by pinasd chen on 2017/7/6.
//  Copyright © 2017年 pinasd chen. All rights reserved.
//

import SpriteKit
import GameplayKit

class VolleygameSC: SKScene {
    
    
//=========>system var<==============
    private var sceneW:Double = 1024
    private var sceneH:Double = 768
    
//=========>player var<==============
    private var vball:SKSpriteNode?
    private var player1 : SKSpriteNode?
    private var player2 : SKSpriteNode?
    
    
    
    override func didMove(to view: SKView) {
        
        
        self.size = CGSize(width: sceneW, height: sceneH)
//        self.physicsWorld.body(in: CGRect(x: -sceneW/2, y: -sceneH/2, width: sceneW, height: sceneH))
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        let p1SizeW = sceneW*0.1
        let p1SizeH = p1SizeW*474/542
        
        self.player1 = self.childNode(withName: "//palyer1") as? SKSpriteNode
        player1?.size = CGSize(width: p1SizeW, height: p1SizeH)
        
        player1?.position = CGPoint(x: -sceneW/4, y: -sceneH/4 )
        
        
        vball = SKSpriteNode.init(imageNamed: "volleyball1.png")
        vball?.position = CGPoint(x: 0, y: 200)
        vball?.size = CGSize(width: 30, height: 30)
        vball?.physicsBody?.isDynamic = true
        vball?.physicsBody?.affectedByGravity = true
        
        
        
        self.addChild(vball!)
        
        
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
            }
    
    func touchMoved(toPoint pos : CGPoint) {
            }
    
    func touchUp(atPoint pos : CGPoint) {
            }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension CGFloat {
    func degreesToRadians() -> CGFloat {
        return self * CGFloat.pi / 180
    }
}
