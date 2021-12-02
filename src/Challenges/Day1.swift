//
//  Day1.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

struct Day1: Challenge {
    private let input: [Int]

    init() {
        let file = AOC.getInput(from: "Day1.txt")
        self.input = file.split(whereSeparator: \.isNewline).map { Int($0)! }
    }

    func runPuzzle1() {
        var count = 0
        (0..<input.count).forEach { index in
            guard index > 0 else { return }

            let current = input[index]
            let previous = input[index-1]
            count += (current > previous) ? 1 : 0
        }

        PrintBuffer.add("\(count)")
    }
    

    func runPuzzle2() {
        let windowSize = 3
        
        var count = 0
        (windowSize..<input.count).forEach { index in
            // As the two consecutive windows have an overlap of N-1, and we are
            // just summing them, we can simply ignore the overlapping value,
            // i.e. only compare the two non-overlapping ones
            let previousWindowSignificant = input[index-windowSize]
            let currentWindowSignificant  = input[index]
            count += (currentWindowSignificant > previousWindowSignificant) ? 1 : 0
        }

        PrintBuffer.add("\(count)")
    }
}
