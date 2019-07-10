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
    var sprites : [String?] = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    
    static let zero = "Zero"
    static let cross = "Cross"
    static let transparent = "Transparent"
    
    func playTurn(index:Int, turn: String) {
//       Turn is one of zero or cross
        sprites[index] = turn;
    }
    
    
}
