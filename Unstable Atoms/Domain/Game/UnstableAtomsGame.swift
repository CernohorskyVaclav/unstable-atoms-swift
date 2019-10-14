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
    
    private var blueTurn: Bool = true
    
    init(rows: Int, columns: Int) {
        fields = Array(repeating: Array(repeating: Field(owner: .none, amountOfAtoms: 0), count: rows), count: columns)
        self.rows = rows
        self.columns = columns
    }
    
    // TODO: Implement
    func makeMove(coordinate: Coordinate) {
        var player: Player
        if(blueTurn) {
            player = Player.blue
            blueTurn = false
        } else {
            player = Player.red
            blueTurn = true
        }
        addAtoms(x: coordinate.x, y: coordinate.y, player: player)
        print("-----")
    }
    
    func addAtoms(x: Int, y: Int, player: Player) {
        if(fields[x][y].owner == Player.blue && blueTurn == false) {
            print("jednicka")
        } else if(fields[x][y].owner == Player.red && blueTurn == true) {
            print("dvojka")
        }
        print("\(x) - \(y)")
        if(fields[x][y].amountOfAtoms == 0) {
            fields[x][y] = Field(owner: player, amountOfAtoms: 1)
        } else if(fields[x][y].amountOfAtoms == 1) {
            fields[x][y] = Field(owner: player, amountOfAtoms: 2)
        } else if(fields[x][y].amountOfAtoms == 2) {
            fields[x][y] = Field(owner: player, amountOfAtoms: 3)
        } else if(fields[x][y].amountOfAtoms == 3) {
            //if(x < 5 && x > 0 && y < 8 && y > 0) {
            fields[x][y] = Field(owner: Player.none, amountOfAtoms: 0)
                divideAtoms(x: x, y: y, player: player)
            //} else {
            //    print("Outofrange")
            //}
        } else {
            print("error")
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
    }
}
