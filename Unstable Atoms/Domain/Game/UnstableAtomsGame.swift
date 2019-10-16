//
// Created by Samuel Kodytek on 29/09/2019.
// Copyright (c) 2019 Educanet. All rights reserved.
//

import Foundation

class UnstableAtomsGame: UnstableAtoms {

    // TODO: Implement
    private(set) var winner: Player = .none

    // TODO: Implement
    private(set) var playerOnMove: Player = .red

    // TODO: Implement
    private(set) var fields: [[Field]] = []

    private (set) var rows: Int
    
    private (set) var columns: Int
    
    private(set) var gameOver: Bool = false
    
    init(rows: Int, columns: Int) {
        fields = Array(repeating: Array(repeating: Field(owner: .none, amountOfAtoms: 0), count: rows), count: columns)
        self.rows = rows
        self.columns = columns
    }
    
    // TODO: Implement
    func makeMove(coordinate: Coordinate) {
        if(gameOver == true) {
            return
        }
        
        var player: Player
        if(playerOnMove == .blue) {
            player = Player.blue
            playerOnMove = .red
        } else {
            player = Player.red
            playerOnMove = .blue
        }
        if(fields[coordinate.x][coordinate.y].owner == player || fields[coordinate.x][coordinate.y].owner == Player.none) {
            addAtoms(x: coordinate.x, y: coordinate.y, player: player)
            //print("-----")
        } else {
            if(playerOnMove == .blue) {
                player = Player.red
                playerOnMove = .red
            } else {
                player = Player.blue
                playerOnMove = .blue
            }
        }
    }
    
    func addAtoms(x: Int, y: Int, player: Player) {
        var value = fields[x][y].amountOfAtoms
        //print("\(x) - \(y)")
        if(value == 3) {
            fields[x][y] = Field(owner: Player.none, amountOfAtoms: 0)
            divideAtoms(x: x, y: y, player: player)
        } else {
            value += 1
            fields[x][y] = Field(owner: player, amountOfAtoms: value)
        }
    }
    
    func divideAtoms(x: Int, y: Int, player: Player) {
        if(x < 5) {
            addAtoms(x: x + 1, y: y, player: player)
        }
        if(x > 0) {
            addAtoms(x: x - 1, y: y, player: player)
        }
        if(y < 8) {
            addAtoms(x: x, y: y + 1, player: player)
        }
        if(y > 0) {
            addAtoms(x: x, y: y - 1, player: player)
        }
        
        var blueies = 0
        var redies = 0
        for columns in fields {
            for rows in columns {
                if(rows.owner == Player.red) {
                    redies += 1
                } else if(rows.owner == Player.blue) {
                    blueies += 1
                }
            }
        }
        if(redies == 0) {
            winner = .blue
            gameOver = true
            playerOnMove = .none
            //print("end")
        } else if(blueies == 0) {
            winner = .red
            gameOver = true
            playerOnMove = .none
            //print("end")
        }
    }
}
