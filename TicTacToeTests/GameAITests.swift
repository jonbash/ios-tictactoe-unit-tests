//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    var board: GameBoard!

    override func setUp() {
        board = GameBoard()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVerticalXWins() {
        for x in 0..<3 {
            try! board.place(mark: .x, on: Coordinate(x,0))
            try! board.place(mark: .o, on: Coordinate((x + 1) % 3,0))
            try! board.place(mark: .x, on: Coordinate(x,1))
            try! board.place(mark: .o, on: Coordinate((x + 1) % 3,1))
            try! board.place(mark: .x, on: Coordinate(x,2))
            
            XCTAssertTrue(game(board: board, isWonBy: .x))
            XCTAssertFalse(game(board: board, isWonBy: .o))
            
            board = GameBoard()
        }
    }
    
    func testHorizontalXWins() {
        for y in 0..<3 {
            try! board.place(mark: .x, on: Coordinate(0, y))
            try! board.place(mark: .o, on: Coordinate(0, (y + 1) % 3))
            try! board.place(mark: .x, on: Coordinate(1, y))
            try! board.place(mark: .o, on: Coordinate(1, (y + 1) % 3))
            try! board.place(mark: .x, on: Coordinate(2, y))
            
            XCTAssertTrue(game(board: board, isWonBy: .x))
            XCTAssertFalse(game(board: board, isWonBy: .o))
            
            board = GameBoard()
        }
    }
    
    func testDiagonalXWins() {
            try! board.place(mark: .x, on: Coordinate(2, 0))
            try! board.place(mark: .x, on: Coordinate(1, 1))
            try! board.place(mark: .x, on: Coordinate(0, 2))
            try! board.place(mark: .o, on: Coordinate(0, 0))
            try! board.place(mark: .o, on: Coordinate(1, 0))
            XCTAssertTrue(game(board: board, isWonBy: .x))
            XCTAssertFalse(game(board: board, isWonBy: .o))
    }

}
