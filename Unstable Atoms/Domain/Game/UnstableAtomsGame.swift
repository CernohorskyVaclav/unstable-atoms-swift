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
    
    init(rows: Int, columns: Int) {
        fields = Array(repeating: Array(repeating: Field(owner: .none, amountOfAtoms: 0), count: rows), count: columns)
        self.rows = rows
        self.columns = columns
    }
    
    // TODO: Implement
    func makeMove(coordinate: Coordinate) {
        addAtoms(x: coordinate.x, y: coordinate.y)
        print("-----")
    }
    
    func addAtoms(x: Int, y: Int) {
        print("\(x) - \(y)")
        if(fields[x][y].amountOfAtoms == 0) {
            fields[x][y] = Field(owner: Player.red, amountOfAtoms: 1)
        } else if(fields[x][y].amountOfAtoms == 1) {
            fields[x][y] = Field(owner: Player.red, amountOfAtoms: 2)
        } else if(fields[x][y].amountOfAtoms == 2) {
            fields[x][y] = Field(owner: Player.red, amountOfAtoms: 3)
        } else if(fields[x][y].amountOfAtoms == 3) {
            //if(x < 5 && x > 0 && y < 8 && y > 0) {
                fields[x][y] = Field(owner: Player.red, amountOfAtoms: 0)
                divideAtoms(x: x, y: y)
            //} else {
            //    print("Outofrange")
            //}
        } else {
            print("error")
        }
    }
    
    func divideAtoms(x: Int, y: Int) {
        
        if(x < 5) {
            addAtoms(x: x + 1, y: y)
        }
        if(x > 0) {
            addAtoms(x: x - 1, y: y)
        }
        if(y < 8) {
            addAtoms(x: x, y: y + 1)
        }
        if(y > 0) {
            addAtoms(x: x, y: y - 1)
        }
    }
}
