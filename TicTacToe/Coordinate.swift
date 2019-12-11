//
//  Coordinate.swift
//  TicTacToe
//
//  Created by Jon Bash on 2019-12-11.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Coordinate: Hashable, Equatable {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

typealias TupleCoordinate = (x: Int, y: Int)

func ==(lhs: Coordinate, rhs: TupleCoordinate) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

func ==(lhs: TupleCoordinate, rhs: Coordinate) -> Bool {
    return rhs == lhs
}

func !=(lhs: Coordinate, rhs: TupleCoordinate) -> Bool {
    return lhs.x != rhs.x || lhs.y != rhs.y
}

func !=(lhs: TupleCoordinate, rhs: Coordinate) -> Bool {
    return rhs != lhs
}
