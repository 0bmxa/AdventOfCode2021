//
//  main.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-01.
//

import Foundation

func main() {
    // Which challenge to measure & how many times
    let challenge = AOC.newestChallenge
    let rounds: UInt64 = 100_000
    
    Swift.print("Measuring challenge \(challenge)")
    
    // Instantiate the challenge
    // Note: avoid protocols here, as the lookup costs us about 100us/call
//    let instance = challenge.init()
    let instance = Day1()
    
    // Time variables
    var start, duration: UInt64
    let nanosPerSecond = UInt64(1_000_000_000)
    
    
    // Measure puzzle 1
    Swift.print("\nPuzzle 1 (\(rounds) rounds)...")
    start = mach_absolute_time()
    
    (0..<rounds).forEach { _ in
        instance.runPuzzle1()
    }
    duration = mach_absolute_time() - start
    
    Swift.print("completed in \(duration/nanosPerSecond) s -> \(duration/rounds) ns/round")
    PrintBuffer.flush()

    
    // Measure puzzle 2
    Swift.print("\nPuzzle 2 (\(rounds) rounds)...")
    
    start = mach_absolute_time()
    (0..<rounds).forEach { _ in
        instance.runPuzzle2()
    }
    duration = mach_absolute_time() - start
    
    Swift.print("completed in \(duration/nanosPerSecond) s -> \(duration/rounds) ns/round")
    PrintBuffer.flush()
}

main()
