//
//  Amritpal_GameViewController.swift
//  amrit_blue_tictactoe
//
//  Created by Amrit on 2019-07-12.
//  Copyright © 2019 Singh Singh. All rights reserved.
//

import UIKit

class Amritpal_GameViewController: UIViewController {

    @IBOutlet var imageCollection: [UIImageView]!
    @IBOutlet var collection: [UIView]!
    
    // New Game variables
    var gameModel = Amritpal_GameModel()
    var currentPlayer = Amritpal_GameModel.cross
    var game = Amritpal_GameModel()
    var stopFurtherInteractions = false
    
    // Old game variables
    var isPastGame = false
    var orderOfMoves : [Int]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for part in imageCollection! {
            addImageTapGesture(imageView: part)
            part.image = UIImage(named: Amritpal_GameModel.transparent)
        }
        
        if (isPastGame) {
            var delay = 0.0
            for move in orderOfMoves! {
                delay += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {self.playMoves(index: move)})
            }
            stopFurtherInteractions = true
        }
        
        // Do any additional setup after loading the view.
    }
    
    func addImageTapGesture(imageView : UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let index = imageCollection.firstIndex(of: tappedImage)!
        
        //            ONLY CARRY ON IF THE TAPPED IMAGE IS AN EMPTY ONE
        if (game.sprites[index] == "" && !stopFurtherInteractions) {
            print(index, game.sprites[index])
            
            tappedImage.image = UIImage(named: currentPlayer)
            
            game.playTurn(index: index, turn: currentPlayer)
            print(game.sprites, "---", index)
            
            //            SWITCH TURNS
            currentPlayer = switchTurns(currentPlayer: currentPlayer)
            
            //            CHECK FOR WINNER
            let winner = game.checkForWinner()
            print(winner)
            if (winner != "") {
                showMessage(message: "\(winner) won")
                game.setWinnerName(symbol: winner)
                game.saveGame()
                
//                saveGame(game: game)
                stopFurtherInteractions = true
            } else {
                showCurrentPlayerTurnMessage(message: nil, font: nil)
            }
            
        }
        
    }
    
    func switchTurns(currentPlayer: String) -> String {
        return currentPlayer == Amritpal_GameModel.cross ? Amritpal_GameModel.zero : Amritpal_GameModel.cross
    }
    
    func showMessage(message:String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "IranSansMobile", size: 19)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(toastLabel)
    }
    
    func showCurrentPlayerTurnMessage(message : String?, font: UIFont?) {
        
        let message = "   Player \(currentPlayer == Amritpal_GameModel.cross ? "1" : "2")'s (\(currentPlayer)) turn  .";
        showMessage(message: message)
    }
    
    func playMoves(index: Int) {
        print(index, game.sprites[index])
        
        imageCollection[index].image = UIImage(named: currentPlayer)
        let winner = currentPlayer
        currentPlayer = switchTurns(currentPlayer: currentPlayer)
        print(winner)
        if (winner != "") {
            showMessage(message: "\(winner) won")
            game.setWinnerName(symbol: winner)
            stopFurtherInteractions = true
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
