//
//  main.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

func main() {
    // The challenge to run
    let challenge = AOC.newestChallenge
    
    print("Challenge", String(describing: challenge))

    // Verify with sample data
    guard challenge.verify() else { return }
    
    // Run both puzzles
    print("\nRunning with real data...")
    let realVersion = challenge.init(useSampleData: false)
    print("Puzzle 1:", realVersion.runPuzzle1())
    print("Puzzle 2:", realVersion.runPuzzle2())
}

main()
