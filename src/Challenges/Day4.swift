//
//  Day4.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-05.
//

import Foundation

struct Day4: Challenge {
    var puzzle1SampleResult: Int? = 4512
    var puzzle2SampleResult: Int?
    
    private let draws: [Int]
    private let boards: [Board]
    
    init(testing: Bool) {
        let input = Self.getInput(sampleData: testing)
        
        self.draws = input[0].split(separator: ",").map { Int($0)! }
        
        let boardHeight = 5
        self.boards = stride(from: 1, to: input.count, by: boardHeight).map {
            let rows = input[$0 ..< $0+5]
            return Board(from: rows)
        }
    }

    func runPuzzle1() -> Int {
        var winningBoard: Board! = nil
        var winningNumber: Int!
        for (round, number) in self.draws.enumerated() {
            if let _winningBoard = self.play(round: round, draw: number) {
                winningBoard = _winningBoard
                winningNumber = number
                break
            }
        }
        
        let boardScore = winningBoard!.fields.reduce(0) { $0 + (!$1.marked ? $1.value : 0) }
        return boardScore * winningNumber
    }
    
    private func play(round: Int, draw number: Int) -> Board? {
        for board in self.boards {
            board.mark(number)
            if round > 5, board.hasBingo {
                return board
            }
        }
        return nil
    }
    
    func runPuzzle2() -> Int {
        return -1
    }
}

extension Day4 {
    struct Field {
        let value: Int
        var marked: Bool = false
    }
    
    class Board {
        var fields: [Field]
        
        init(from rows: ArraySlice<Substring>) {
            guard rows.count == 5 else { fatalError() }
            
            self.fields = rows.flatMap { row in
                row.split(separator: " ").map { Field(value: Int($0)!) }
            }
        }
        
        func mark(_ number: Int) {
            for i in (0..<self.fields.count) {
                if self.fields[i].value == number {
                    self.fields[i].marked = true
                }
            }
        }
        
        func rowHasBingo(_ row: Int) -> Bool {
            for i in (row*5 ... row*5+4) {
                if !self.fields[i].marked { return false }
            }
            return true
        }
        
        func colHasBingo(_ col: Int) -> Bool {
            for i in stride(from: col, to: 25, by: 5) {
                if !self.fields[i].marked { return false }
            }
            return true
        }
        
        var hasBingo: Bool {
            for row in (0..<5) {
                if self.rowHasBingo(row) { return true }
            }
            for col in (0..<5) {
                if self.colHasBingo(col) { return true }
            }
            return false
        }
    }
}
