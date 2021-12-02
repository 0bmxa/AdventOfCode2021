//
//  AOC.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

protocol Challenge {
    init()
    func runPuzzle1()
    func runPuzzle2()
}

enum AOC {
    static let challenges: [Challenge.Type] = [
        Day1.self,
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
