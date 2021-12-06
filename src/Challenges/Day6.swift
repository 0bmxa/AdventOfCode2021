//
//  Day6.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-06.
//

import Foundation

struct Day6: Challenge {
    var puzzle1SampleResult: Int? = 5934
    var puzzle2SampleResult: Int? = 26984457539
    
    let input: Substring
    
    init(testing: Bool) {
        self.input = Self.getInput(sampleData: testing)[0]
    }
    
    func runPuzzle1() -> Int {
        let rounds = 80
        let school = School(from: input)
        
        for _ in (0..<rounds) {
            school.age()
        }
        
        return Int(school.fishCount)
    }
    
    func runPuzzle2() -> Int {
        let rounds = 256
        let school = School(from: input)
        
        for _ in (0..<rounds) {
            school.age()
        }
        
        return Int(school.fishCount)
    }
}

extension Day6 {
    class School: CustomStringConvertible {
        
        /// List of fish, length 9 (0...8).
        /// - index: remaining days until spawn
        /// - value: count of fish
        var fish: [UInt64]
        
        init(from initial: Substring) {
            self.fish = Array(repeating: 0, count: 9)
            
            initial.split(separator: ",").forEach {
                let age = Int($0)!
                self.fish[age] += 1
            }
        }
        
        func age() {
            // Remove the fish at 0 days
            let numberOfFishToSpawn = self.fish.remove(at: 0)

            // Restart the existing fish at 6 days
            self.fish[6] += numberOfFishToSpawn
            
            // Add the new fish at 8 days
            self.fish.append(numberOfFishToSpawn)
        }
        
        var fishCount: UInt64 {
            self.fish.reduce(0) { $0 + $1 }
        }

        var description: String {
            let (title, values) = (0..<self.fish.count).reduce(("Remain: ", "Count:  ")) { acc, i in
                let num = "\(self.fish[i])"
                return (
                    acc.0 + String(repeating: " ", count: num.count) + "\(i)",
                    acc.1 + " " + num
                )
            }
            
            return title + "\n" + values + "\n"
        }
    }
}
