//
//  Day2.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-02.
//

import Foundation

struct BoatVector {
    var x: Int32
    var y: Int32
}

struct Day2: Challenge {
    private let input: [BoatVector]

    init() {
        let file = AOC.getInput(from: "Day2.txt")
        self.input = file.split(whereSeparator: \.isNewline).map { line in
            let parts = line.split(separator: " ")
            let direction = parts[0]
            let amount = Int32(parts[1])!
            
            switch direction {
            case "forward": return BoatVector(x: amount, y: 0)
            case "down":    return BoatVector(x: 0, y: amount)
            case "up":      return BoatVector(x: 0, y: amount * -1)
            default: fatalError()
            }
        }
    }

    func runPuzzle1() {
        let sum = self.input.reduce(into: BoatVector(x: 0, y: 0)) { sum, current in
            sum.x += current.x
            sum.y += current.y
        }

        let result = sum.x * sum.y
        
        PrintBuffer.add("\(result)")
    }
    

    func runPuzzle2() {
        // TODO
    }
}
