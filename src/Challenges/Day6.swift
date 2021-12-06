//
//  Day6.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-06.
//

import Foundation

struct Day6: Challenge {
    var puzzle1SampleResult: Int? = 5934
    var puzzle2SampleResult: Int?
    
    let school: School
    
    init(testing: Bool) {
        let input = Self.getInput(sampleData: testing)[0]
        self.school = School(from: input)
    }
    
    func runPuzzle1() -> Int {
        let rounds = 80
        
        for _ in (0..<rounds) {
            self.school.age()
        }
        
        return self.school.fish.count
    }
    
    func runPuzzle2() -> Int {
        return 0
    }   
}

extension Day6 {
    class School: CustomStringConvertible {
        var fish: [Fish]

        init(from initial: Substring) {
            self.fish = initial.split(separator: ",").map { Fish(remainingDays: Int($0)!) }
        }

        func age() {
            (0..<self.fish.count).forEach { i in
                let shouldSpawn = self.fish[i].age()
                if shouldSpawn { self.fish.append(Fish()) }
            }
        }
        
        var description: String {
            self.fish.reduce("") { $0 + "\($1.remainingDays)," }
        }
    }
    
    struct Fish {
        var remainingDays: Int
        
        init(remainingDays: Int = 8) {
            self.remainingDays = remainingDays
        }
        
        /// Ages the fish by one day
        /// - Returns: Whether a new fish should be spawned.
        mutating func age() -> Bool {
            if remainingDays == 0 {
                self.remainingDays = 6
                return true
            }
            self.remainingDays -= 1
            return false
        }
    }
}
