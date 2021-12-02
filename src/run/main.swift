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
    
    Swift.print("Running challenge", String(describing: challenge))

    // Instantiate
    let instance = challenge.init()

    // Run both puzzles
    Swift.print("\nPuzzle 1:")
    instance.runPuzzle1()
    PrintBuffer.flush()
    
    Swift.print("\nPuzzle 2:")
    instance.runPuzzle2()
    PrintBuffer.flush()
}
main()
