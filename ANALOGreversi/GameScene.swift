
//  Created by mac on 2018/10/03.
//  Copyright © 2018年 AKADA TEPPEI. All rights reserved.
//

import SpriteKit
import GameplayKit

enum StoneLevel :CGFloat {
//    case back = 0
    case board = 10
    case moving = 100
    case enlarged = 200
}


class GameScene: SKScene {

    
    
    override func didMove(to view: SKView) {

//        let backGround = SKSpriteNode(imageNamed:"Board")
//        self.addChild(backGround)
//        backGround.position = CGPoint(x:0, y:0)
        
        
//        let black = Stone(stoneType: .black)
//        black.position = CGPoint(x: 100, y: 200)
//        black.zPosition = 50
//        addChild(black)
//        
//        let white = Stone(stoneType: .white)
//        white.position = CGPoint(x:300, y: 200)
//        addChild(white)
        
//        let backNode = SKSpriteNode(imageNamed: "Board")
//        backNode.position = CGPoint(x:0, y:0)
//        backNode.zPosition = StoneLevel.back.rawValue
//        addChild(backNode)

        let buttonBlack = SKSpriteNode(imageNamed: "image_black")
        buttonBlack.position = CGPoint(x:0, y:480)
        buttonBlack.zPosition = 201
        buttonBlack.name = "buttonBlack"
        self.addChild(buttonBlack)
        
        let buttonWhite = SKSpriteNode(imageNamed: "image_white")
        buttonWhite.position = CGPoint(x:0, y:-480)
        buttonWhite.zPosition = 201
        buttonWhite.name = "buttonWhite"
        self.addChild(buttonWhite)
        
        let buttonNewGame = SKSpriteNode(imageNamed: "image_NewGame")
        buttonNewGame.position = CGPoint (x:250, y:-550)
        buttonNewGame.zPosition = 201
        buttonNewGame.name = "buttonNewGame"
        self.addChild(buttonNewGame)

    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            if let stone = atPoint(location) as? Stone{
                stone.position = location
                
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var white: Stone
        var black: Stone
        
        for touch in touches{
            let location = touch.location(in: self)
            if let stone = atPoint(location) as? Stone{
                stone.zPosition = StoneLevel.moving.rawValue
                if touch.tapCount > 1{
                    stone.flip()
                    
                }
                
            }
                if let touch = touches.first as UITouch? {
                    let location = touch.location(in: self)
                    if self.atPoint(location).name == "buttonBlack" {
                        black = Stone(stoneType: .black)
                        black.position = CGPoint(x: 160, y: 480)
                        black.size = CGSize(width: 80, height: 80)
                        black.name = "black"
                        black.zPosition = 50
                        addChild(black)
                    }
                    if self.atPoint(location).name == "buttonWhite" {
                        white = Stone(stoneType: .white)
                        white.position = CGPoint(x: -160, y: -480)
                        white.size = CGSize(width: 80, height: 80)
                        white.name = "white"
                        white.zPosition = 50
                        addChild(white)
                    }
                    if self.atPoint(location).name == "buttonNewGame"{
                        addChild(white)
                        addChild(black)
                        self.removeChildren(in: [black, white])

                        print("NewGame")
                        
                    }
                    
                }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let stone = atPoint(location) as? Stone{
                stone.zPosition = StoneLevel.board.rawValue
                stone.removeFromParent()
                addChild(stone)
            }
        }
    }
    
    func newgame(){
    }
    
    
    
}




