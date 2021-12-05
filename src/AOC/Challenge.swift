//
//  AOC.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

protocol Challenge {
    init(testing: Bool)
    func runPuzzle1() -> Int
    func runPuzzle2() -> Int
    
    var puzzle1SampleResult: Int? { get }
    var puzzle2SampleResult: Int? { get }
}

extension Challenge {
    static func verify(puzzle: Int) -> Bool {
        // Instantiate
        let challenge = self.init(testing: true)
        
        // Get expected result, if available
        let _expected = (puzzle == 1) ? challenge.puzzle1SampleResult : challenge.puzzle2SampleResult
        guard let expected = _expected else {
            print("Not implemented.")
            return false
        }

        // Run selected puzzle
        let result = (puzzle == 1) ? challenge.runPuzzle1() : challenge.runPuzzle2()

        if result == expected {
            print("Test: PASS (result: \(result))")
            return true
        } else {
            print("Test: FAIL (got: \(result), expected: \(expected))")
            return false
        }
    }
    
    static var name: String {
        String(describing: Self.self)
    }

    static func getInput(sampleData: Bool) -> [String.SubSequence] {
        let projectDir = Bundle.main.infoDictionary!["PROJECT_DIR"] as! String

        let prefix = sampleData ? "Example" : ""
        let filePath = projectDir + "/input/" + prefix + self.name + ".txt"
        let content = try! String(contentsOfFile: filePath)

        return content.split(whereSeparator: \.isNewline)
    }
}
