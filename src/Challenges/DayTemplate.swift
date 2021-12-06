//
//  Day<#Day Number#>.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-<#Day Number#>.
//

import Foundation

struct Day<#Day Number#>: Challenge {
    var puzzle1SampleResult: Int?
    var puzzle2SampleResult: Int?
    
    let input: [Substring]
    
    init(testing: Bool) {
        self.input = Self.getInput(sampleData: testing)
    }
    
    func runPuzzle1() -> Int {
        return 0
    }
    
    func runPuzzle2() -> Int {
        return 0
    }   
}
