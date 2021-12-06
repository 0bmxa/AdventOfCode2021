//
//  Day4.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-05.
//

import Foundation

struct Day4: Challenge {
    var puzzle1SampleResult: Int? = 4512
    var puzzle2SampleResult: Int? = 1924
    
    private let input: [Substring]
    
    init(testing: Bool) {
        self.input = Self.getInput(sampleData: testing)
    }
    
    var playData: ([Int], [Board]) {
        let draws = self.input[0].split(separator: ",").map { Int($0)! }
        let boards: [Board] = stride(from: 1, to: input.count, by: 5).map {
            let rows = self.input[$0 ..< $0+5]
            return Board(from: rows)
        }
        return (draws, boards)
    }

    func runPuzzle1() -> Int {
        let (draws, boards) = self.playData
        
        var winningBoard: Board! = nil
        var winningNumber: Int!
        for (round, number) in draws.enumerated() {
            if let _winningBoard = self.play(round: round, draw: number, boards: boards) {
                winningBoard = _winningBoard
                winningNumber = number
                break
            }
        }
        
        let boardScore = winningBoard!.fields.reduce(0) { $0 + (!$1.marked ? $1.value : 0) }
        return boardScore * winningNumber
    }
    
    func runPuzzle2() -> Int {
        let (draws, boards) = self.playData
        
        var loosingBoard: Board! = nil
        var loosingNumber: Int!
        for (round, number) in draws.enumerated() {
            print("Round ", round, "\tNumber:", number)
            if let winningBoard = self.play(round: round, draw: number, boards: boards) {
                print("a board won")
                
                let remainingBoards = boards.filter({ !$0.won }).count
                if remainingBoards == 0 {
                    loosingBoard = winningBoard
                    loosingNumber = number
                    break
                }
            }
        }
        
        let boardScore = loosingBoard!.fields.reduce(0) { $0 + (!$1.marked ? $1.value : 0) }
        return boardScore * loosingNumber
    }
    
    private func play(round: Int, draw number: Int, boards: [Board]) -> Board? {
        var winner: Board?
        for board in boards {
            if board.won { continue }
            board.mark(number)
            if round > 5, board.hasBingo {
                board.won = true
                winner = board
            }
        }
        return winner
    }
}

extension Day4 {
    struct Field {
        let value: Int
        var marked: Bool = false
    }
    
    class Board {
        var fields: [Field]
        var won: Bool = false
        
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
