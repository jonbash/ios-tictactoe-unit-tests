//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    // test vertical
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            if board[(x,y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // test horizontal
    for y in 0..<3 {
        var numMarks = 0
        for x in 0..<3 {
            if board[(x,y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    
    // test diagonals
    if board[(1,1)] == player {
        
        if board[(0,0)] == player {
            if board[(2,2)] == player {
                return true
            }
        } else if board[(0,2)] == player {
            if board[(2,0)] == player {
                return true
            }
        }
    }
    
    return false
}
