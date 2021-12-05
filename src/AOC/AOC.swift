//
//  AOC.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

protocol Challenge {
    init(useSampleData: Bool)
    func runPuzzle1() -> Int
    func runPuzzle2() -> Int
    
    var puzzle1SampleResult: Int { get }
    var puzzle2SampleResult: Int { get }
}

extension Challenge {
    static func verify(puzzle: Int) -> Bool {
        // Instantiate
        let challenge = self.init(useSampleData: true)
        
        // Run selected puzzle
        let result   = (puzzle == 1) ? challenge.runPuzzle1()        : challenge.runPuzzle2()
        let expected = (puzzle == 1) ? challenge.puzzle1SampleResult : challenge.puzzle2SampleResult

        let success = (result == expected)
        let message = (success ? "PASS (result: \(result))" : "FAIL (got: \(result), expected: \(expected)")
        print("Test:", message)
        return success
    }
}

enum AOC {
    static func getInput(from fileName: String) -> String {
        let projectDir = Bundle.main.infoDictionary!["PROJECT_DIR"] as! String
        let inputFilePath = projectDir + "/input/" + fileName
        return try! String(contentsOfFile: inputFilePath)
    }

    static func getInput(day: Int, sample: Bool) -> [String.SubSequence] {
        let prefix = sample ? "Example" : ""
        let fileName = "\(prefix)Day\(day).txt"
        
        let projectDir = Bundle.main.infoDictionary!["PROJECT_DIR"] as! String
        let inputFilePath = projectDir + "/input/" + fileName
        let content = try! String(contentsOfFile: inputFilePath)

        return content.split(whereSeparator: \.isNewline)
    }
}
