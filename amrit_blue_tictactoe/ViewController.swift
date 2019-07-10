//
//  ViewController.swift
//  amrit_blue_tictactoe
//
//  Created by Singh Singh on 2019-05-29.
//  Copyright © 2019 Singh Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collection: [UIView]!
    @IBOutlet var imageCollection: [UIImageView]!
    
    var currentPlayer = TicTacToe.cross
    
    var game = TicTacToe()
    
    @IBAction func Button(_ sender: UIButton) {
        // sender.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }
    
    func addImageTapGesture(imageView : UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        var index = imageCollection.firstIndex(of: tappedImage)!
        
//        ONLY CARRY ON IF THE TAPPED IMAGE IS AN EMPTY ONE
        if (game.sprites[index] == nil) {
            print(index, game.sprites[index])
            
            tappedImage.image = UIImage(named: currentPlayer)
            
            game.playTurn(index: index, turn: currentPlayer)
            print(game.sprites, "---", index)
            
            //        SWITCH TURNS
            currentPlayer = switchTurns(currentPlayer: currentPlayer)
        }
       
    }
    
    func switchTurns(currentPlayer: String) -> String {
        return currentPlayer == TicTacToe.cross ? TicTacToe.zero : TicTacToe.cross
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for part in collection! {
//            // addPanGesture(view: part)
//            print("COLORS - " , part.backgroundColor!)
//        }
        
        for part in imageCollection! {
            addImageTapGesture(imageView: part)
            part.image = UIImage(named: TicTacToe.transparent)
            print("COLORS - ")
        }
        
    }
    
    
    


}

