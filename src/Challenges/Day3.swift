//
//  Day3.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-03.
//

import Foundation

struct Day3: Challenge {
    private let input: [String.SubSequence]
    private let bitDepth: Int

    init() {
        let file = AOC.getInput(from: "Day3.txt")
        self.input = file.split(whereSeparator: \.isNewline)
        self.bitDepth = self.input[0].count
    }

    func runPuzzle1() {
        var storage = Array.init(repeating: 0, count: bitDepth)
        
        self.input.forEach { entry in
            entry.enumerated().forEach { (i, bit) in
                storage[i] += (bit == "1") ? 1 : -1;
            }
        }
        
        let gammaBinary = storage
                .map { ($0 > 0) ? 1 : 0 }
                .reduce(into: "") { $0 += String($1) }
        let gamma = UInt16(gammaBinary, radix: 2)!
        
        let offset = gamma.bitWidth - bitDepth
        let epsilon = (~gamma << offset) >> offset
        
        let result = Int(gamma) * Int(epsilon)
        

        PrintBuffer.add("\(result)")
    }
    

    func runPuzzle2() {
        //
    }
}
