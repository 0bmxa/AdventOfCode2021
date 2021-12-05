//
//  Day3.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-03.
//

import Foundation

class Day3: Challenge {
    var puzzle1SampleResult = 198
    var puzzle2SampleResult = 230
    
    private let input: [String.SubSequence]
    private let bitDepth: Int
    
    private var gamma: UInt16?
    private var epsilon: UInt16?
    
    required init(useSampleData: Bool = false) {
        self.input = Self.getInput(day: 3, sample: useSampleData)
        self.bitDepth = self.input[0].count
    }

    func runPuzzle1() -> Int {
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

        self.gamma = gamma
        self.epsilon = epsilon

        return Int(gamma) * Int(epsilon)
    }
    

    func runPuzzle2() -> Int {
        let sortedInput = self.input
            .map { UInt16($0, radix: 2)! }
            .sorted { $1 > $0}
        
        let oxygen = sortedInput.first { $0 > self.gamma! }!
        let co2    = sortedInput.first { $0 > self.epsilon! }!
        
        return Int(oxygen) * Int(co2)
    }
}
