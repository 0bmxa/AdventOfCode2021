//
//  Day2.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-02.
//

import Foundation

struct Day2: Challenge {
    private let input: [CGVector]

    init() {
        let file = AOC.getInput(from: "Day2.txt")
        self.input = file.split(whereSeparator: \.isNewline).map { line in
            let parts = line.split(separator: " ")
            let direction = parts[0]
            let amount = Int(parts[1])!
            
            switch direction {
            case "forward": return CGVector(dx: amount, dy: 0)
            case "down":    return CGVector(dx: 0, dy: amount)
            case "up":      return CGVector(dx: 0, dy: -amount)
            default: fatalError()
            }
        }
    }

    func runPuzzle1() {
        let sum = self.input.reduce(into: CGVector()) { sum, current in
            sum.dx += current.dx
            sum.dy += current.dy
        }

        let result = sum.dx * sum.dy
        
        PrintBuffer.add("\(result)")
    }
    

    func runPuzzle2() {
        // TODO
    }
}
