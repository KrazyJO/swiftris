//
//  GameViewController.swift
//  Swiftris
//
//  Created by Jörn Otte on 01.10.18.
//  Copyright © 2018 Jörn Otte. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene : GameScene!
    var swiftris: Swiftris!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        
        scene.tick = didTick
        swiftris = Swiftris()
        swiftris.beginGame()
        
        scene.addPreviewShapeToScene(shape: swiftris.nextShape!, completion: {
            let nextShapes = self.swiftris.newShape()
            self.scene.startTicking()
            self.scene.addPreviewShapeToScene(shape: nextShapes.nextShape!, completion: {})
        })
        
        skView.presentScene(scene)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func didTick() {
        swiftris.fallingShape?.lowerShapeByOneRow()
        scene.redrawShape(shape: swiftris.fallingShape!, completion: {})
    }
}
