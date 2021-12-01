//
//  Day1.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

struct Day1: Challenge {
    private let input: [String.SubSequence]
    
    init() {
        let file = AOC.getInput(from: "Day1.txt")
        self.input = file.split(whereSeparator: \.isNewline)
    }
    
    func runPuzzle1() {
        let increasingLines = self.input.enumerated().filter { (index, value) in
            guard index > 0 else { return false }
            
            let current = Int(value)!
            let previous = Int(self.input[index-1])!
            return current > previous
        }
        
        print(increasingLines.count)
    }
    
    func runPuzzle2() {        
        let windowSize = 3
        let increasingWindows = self.input.enumerated().filter { (index, _) in
            guard index >= windowSize else { return false }

            let previousWindowIndices = (index - windowSize)     ... (index - 1)
            let currentWindowIndices  = (index - windowSize + 1) ... index
            
            let previousWindow = self.input[previousWindowIndices].reduce(into: 0) { sum, value in
                sum += Int(value)!
            }
            
            let currentWindow = self.input[currentWindowIndices].reduce(into: 0) { sum, value in
                sum += Int(value)!
            }
            
            return currentWindow > previousWindow
        }
        
        print(increasingWindows.count)
    }
}
