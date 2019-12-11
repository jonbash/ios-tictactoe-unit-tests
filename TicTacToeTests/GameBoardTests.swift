//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {
    var board: GameBoard!
    
//    var testPlacements: [MarkPlacement] = [
//        (coord: (x: 0, y: 0), mark: GameBoard.Mark.x),
//        (coord: (x: 0, y: 1), mark: GameBoard.Mark.o)
//    ]
    var testPlacements: [Coordinate: GameBoard.Mark] = [
        Coordinate(x:0,y:0): .x,
        Coordinate(x:0,y:1): .o
    ]

    override func setUp() {
        self.board = GameBoard()
    }
    
    // MARK: - Tests
    
    func testNewEmptyBoard() {
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(board[(x: x, y: y)], "The entry at \(x), \(y) was \(board[(x: x, y: y)]!) instead of nil!")
            }
        }
    }

    func testSuccessfulMarkPlacements() {
        placeTestMarks()
        for (coord, mark) in testPlacements {
            XCTAssertEqual(board[coord], mark)
        }
    }
    
    func testEmptyCoordinatesAfterMarkPlacements() {
        placeTestMarks()
        for x in 0..<3 {
            for y in 0..<3 {
                if testPlacements.keys.contains(Coordinate(x: x, y: y)) {
                    continue
                }
                XCTAssertNil(board[(x:x, y:y)])
            }
        }
    }
    
    func testFailOnDoublePlacement() {
        placeTestMarks()
        XCTAssertThrowsError(try placeMarks(testPlacements)) {
            XCTAssertEqual($0 as? GameBoardError, GameBoardError.invalidSquare)
        }
    }
    
    func testIsFull() {
        var isX = true
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertFalse(board.isFull)
                let mark: GameBoard.Mark = isX ? .x : .o
                try! board.place(mark: mark, on: Coordinate(x: x, y: y))
                isX.toggle()
            }
        }
        
        XCTAssertTrue(board.isFull)
    }
    
    // MARK: - Helper Functions
    
    func placeMarks(_ placements: [Coordinate: GameBoard.Mark]) throws {
        for (coord, mark) in placements {
            try board.place(mark: mark, on: coord)
        }
    }
    
    func placeTestMarks() {
        try! placeMarks(testPlacements)
    }
}
