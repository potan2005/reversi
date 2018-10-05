//
//
//  Created by mac on 2018/10/03.
//  Copyright © 2018年 AKADA TEPPEI. All rights reserved.
//

import Foundation
import SpriteKit

enum StoneType :Int{
    case black
    case white
}

class Stone : SKSpriteNode{
    
    let stoneType :StoneType
    let frontTexture :SKTexture
    let backTexture :SKTexture
    var faceUp = true
    
    required init?(coder aDecoder: NSCoder){
        fatalError("NSCoding not supported")
    }
    
    init(stoneType: StoneType){
        self.stoneType = stoneType
        switch stoneType {
        case .black:
            frontTexture = SKTexture(imageNamed: "image_black")
            backTexture = SKTexture(imageNamed: "image_white")
        case .white:
            frontTexture = SKTexture(imageNamed: "image_white")
            backTexture = SKTexture(imageNamed: "image_black")
        }
    
        
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size())
    }
    
    
    func flip() {
        if faceUp{
            self.texture = backTexture
        }else{
            self.texture = frontTexture
        }
        faceUp = !faceUp
    }
    
}

