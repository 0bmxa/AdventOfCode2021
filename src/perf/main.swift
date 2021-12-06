//
//  main.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

func main() {
    // Which challenge to measure & how many times
    let challenge = Day6.self
    let rounds: UInt64 = 100_000
    
    print("Measuring challenge \(challenge.name)")
    
    // Instantiate the challenge
    // Note: avoid protocols here, as the lookup costs us about 100us/call
    let instance = challenge.init(testing: false)
    
    // Time variables
    var start, duration: UInt64
    let nanosPerSecond = UInt64(1_000_000_000)
    
    
    // Measure puzzle 1
    print("\nPuzzle 1 (\(rounds) rounds)...")
    var result = 0
    start = mach_absolute_time()
    
    (0..<rounds).forEach { _ in
        result = instance.runPuzzle1()
    }
    duration = mach_absolute_time() - start
    
    print("completed in \(duration/nanosPerSecond) s -> \(duration/rounds) ns/round")
    print("Result:", result)

    
    // Measure puzzle 2
    print("\nPuzzle 2 (\(rounds) rounds)...")
    
    start = mach_absolute_time()
    (0..<rounds).forEach { _ in
        result = instance.runPuzzle2()
    }
    duration = mach_absolute_time() - start
    
    print("completed in \(duration/nanosPerSecond) s -> \(duration/rounds) ns/round")
    print("Result:", result)
}

main()
