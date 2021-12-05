//
//  main.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

func main() {
    // The challenge to run
    let challengeType = Day5.self
    
    print("Challenge", challengeType.name)

    let challenge = challengeType.init(testing: false)

    // Verify & run puzzle 1
    print("\nPuzzle 1:")
    guard challengeType.verify(puzzle: 1) else { return }
    print("Real data:", challenge.runPuzzle1())

    // Verify & run puzzle 2
    print("\nPuzzle 2:")
    guard challengeType.verify(puzzle: 2) else { return }
    print("Real data:", challenge.runPuzzle2())
}

main()
