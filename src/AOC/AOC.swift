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
    static func verify() -> Bool {
        print("\nVerifying with sample data...")
        
        // Instantiate
        let testVersion = self.init(useSampleData: true)
        
        // Run both puzzles
        let resultP1 = testVersion.runPuzzle1()
        let passP1 = (resultP1 == testVersion.puzzle1SampleResult)
        print("Puzzle 1:", resultP1, passP1 ? "PASS" : "FAIL!")
        guard passP1 else { return false }
        
        let resultP2 = testVersion.runPuzzle2()
        let passP2 = (resultP2 == testVersion.puzzle2SampleResult)
        print("Puzzle 2:", resultP2, passP2 ? "PASS" : "FAIL!")
        guard passP2 else { return false }
        
        return true
    }
}

enum AOC {
    static let challenges: [Challenge.Type] = [
        Day1.self,
        Day2.self,
        Day3.self,
    ]
    
    static var newestChallenge: Challenge.Type {
        return self.challenges.last!
    }
    
    static func getInput(from fileName: String) -> String {
        let projectDir = Bundle.main.infoDictionary!["PROJECT_DIR"] as! String
        let inputFilePath = projectDir + "/input/" + fileName
        return try! String(contentsOfFile: inputFilePath)
    }
}
