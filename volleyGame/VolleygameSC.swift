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
    private let PPI:Double = 1024
    private var sceneW:Double?
    private var sceneH:Double?
    private var p1SizeW:Double?
    private var p1SizeH:Double?
    
//=========>player var<==============
    private var vball:SKSpriteNode?
    private var player1 : SKSpriteNode?
    private var p1Speed:Double = 50
    private var player2 : SKSpriteNode?
    
    
    
    override func didMove(to view: SKView) {
        sceneW = PPI
        sceneH = PPI * Double(self.size.width / self.size.height)
        p1SizeW = sceneW! * 0.1
        p1SizeH = p1SizeW! * 474/542
        //==========gravity set===============
        self.size = CGSize(width: sceneW!, height: sceneH!)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -0.8)
        
        var linePoints = [
            CGPoint(x: -sceneW!/2, y: -sceneH! * 0.35 - p1SizeH! * 0.5),
            CGPoint(x: sceneW!/2, y: -sceneH! * 0.35 - p1SizeH! * 0.5)
            ]
        let ground = SKShapeNode(points: &linePoints,
                                 count: linePoints.count)
        ground.physicsBody = SKPhysicsBody(edgeChainFrom: ground.path!)
        ground.lineWidth = 5
        self.addChild(ground)
        
        
        //==========palyer1===================
        
        
        self.player1 = self.childNode(withName: "//palyer1") as? SKSpriteNode
        player1?.size = CGSize(width: p1SizeW!, height: p1SizeH!)
        
        player1?.position = CGPoint(x: -sceneW!/4, y: -sceneH! * 0.35 )
        player1?.physicsBody = SKPhysicsBody(texture: player1!.texture!, size: player1!.size)
        player1?.physicsBody?.isDynamic = true
//        player1?.physicsBody?.affectedByGravity = true
        player1?.zPosition = 10
        
        
        //==========ball===================
        vball = SKSpriteNode(imageNamed: "volleyball1.png")
        vball?.position = CGPoint(x: 0, y: 200)
        vball?.size = CGSize(width: 30, height: 30)
        vball?.physicsBody = SKPhysicsBody(texture: vball!.texture!,size: (vball?.size)!)
        vball?.physicsBody?.isDynamic = true
        vball?.physicsBody?.affectedByGravity = true
        vball?.zPosition = 20
        ground.addChild(vball!)
        
        
    }
    
//==============>touch<=====================
    //=========check bounder=============
    private func checkpoint(_ pos : CGPoint) -> CGPoint{
        
        var xpos = pos.x
        if xpos > CGFloat(sceneW!/2 - p1SizeW!/4) {
            xpos = CGFloat(sceneW!/2 - p1SizeW!/4)
        }else if xpos < CGFloat(-sceneW!/2 + p1SizeW!/4) {
            xpos = CGFloat(-sceneW!/2 + p1SizeW!/4)
        }
        
        return CGPoint(x:xpos,y:player1!.position.y)
    }
    func touchDown(atPoint pos : CGPoint) {
        
        let moveToPoint = checkpoint(pos)
        let time:TimeInterval = Double(abs(Int32(pos.x - player1!.position.x)))/(150 + 100 * p1Speed/100 )
        let move = SKAction.move(to: moveToPoint, duration: time)
        
        player1?.run(move)
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
        let moveToPoint = checkpoint(pos)
        let time:TimeInterval = Double(abs(Int32(pos.x - player1!.position.x)))/(150 + 100 * p1Speed/100 )
        let move = SKAction.move(to: moveToPoint, duration: time)
//        print(move)
        player1?.run(move)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        let moveToPoint = checkpoint(pos)
        let time:TimeInterval = Double(abs(Int32(pos.x - player1!.position.x)))/(150 + 100 * p1Speed/100 )
        let move = SKAction.move(to: moveToPoint, duration: time)
        player1?.run(move)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let pos = touches.first?.location(in: self)
        touchDown(atPoint: pos!)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pos = touches.first?.location(in: self)
        touchMoved(toPoint: pos!)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pos = touches.first?.location(in: self)
        touchUp(atPoint: pos!)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if player1!.zRotation > 0.1 || player1!.zRotation < -0.1{
            player1?.zRotation = 0
        }
       
        
    }
}

extension CGFloat {
    func degreesToRadians() -> CGFloat {
        return self * CGFloat.pi / 180
    }
}
