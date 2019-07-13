//
//  TicTacToe.swift
//  amrit_blue_tictactoe
//
//  Created by Amrit on 2019-06-08.
//  Copyright © 2019 Singh Singh. All rights reserved.
//

import Foundation

class TicTacToe {
    var values : [String]?
    var sprites : [String] = ["","","",
                              "","","",
                              "","",""]
    var winner : String?
    var gameFinishedOn: Date?
    
    static let zero = "Zero"
    static let cross = "Cross"
    static let draw = "Draw"
    static let transparent = "Transparent"
    
    func playTurn(index:Int, turn: String) {
//       Turn is one of zero or cross
        sprites[index] = turn;
    }
    
    func checkForWinner() -> String {
        if (sprites[0] != "" && (sprites[0]) == (sprites[1]) && sprites[1] == sprites[2]) {
            return sprites[0]
        }
        if (sprites[3] != "" && (sprites[3]) == (sprites[4]) && sprites[4] == sprites[5]) {
            return sprites[3]
        }
        if (sprites[6] != "" && (sprites[6]) == (sprites[7]) && sprites[7] == sprites[8]) {
            return sprites[6]
        }
        if (sprites[0] != "" && (sprites[0]) == (sprites[3]) && sprites[3] == sprites[6]) {
            return sprites[0]
        }
        if (sprites[1] != "" && (sprites[1]) == (sprites[4]) && sprites[4] == sprites[7]) {
            return sprites[1]
        }
        if (sprites[2] != "" && (sprites[2]) == (sprites[5]) && sprites[5] == sprites[8]) {
            return sprites[2]
        }
        if (sprites[0] != "" && (sprites[0]) == (sprites[4]) && sprites[4] == sprites[8]) {
            return sprites[0]
        }
        if (sprites[2] != "" && (sprites[2]) == (sprites[4]) && sprites[4] == sprites[6]) {
            return sprites[2]
        }
        var count = 0;
        for value in sprites {
            if (value != "") {
                count+=1
            }
        }
        if (count == 9) {
            return TicTacToe.draw
        }
        return ""
    }
    
    func getPlayerName(symbol:String) -> String{
        return "   \(symbol == TicTacToe.zero ? "Player 2" : "Player 1") won the match.  "
    }
    
    func setWinnerName(symbol: String) {
        self.winner = symbol
        self.gameFinishedOn = Date()
    }

    func gameString() -> String {
        return "\(sprites.split(separator: "-")),\(self.winner!),\(self.gameFinishedOn!)"
    }
    
    func saveGame() {
        var numberOfGamesPlayed = UserDefaults.standard.integer(forKey: "numberOfGamesPlayed")
        numberOfGamesPlayed += 1
        
        UserDefaults.standard.set(self.winner!, forKey: "Result_\(String(numberOfGamesPlayed))")
        
        let currentTime = Date().timeIntervalSince1970
        
        UserDefaults.standard.set(currentTime, forKey: "Timestamp_\(String(numberOfGamesPlayed))")
        
    }
    
}
