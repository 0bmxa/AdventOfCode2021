//
//  Day5.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-05.
//

import Foundation

struct Day5: Challenge {
    var puzzle1SampleResult: Int { 5 }
    var puzzle2SampleResult: Int { 0 }
    
    private let input: [String.SubSequence]
    
    init(useSampleData: Bool) {
        self.input = AOC.getInput(day: 5, sample: useSampleData)
    }
    
    func runPuzzle1() -> Int {
        let points = self.input.flatMap { row -> [Point] in
            let line = Line(from: row)
            return line.allPoints
        }
        
        let histrogram = points.reduce(into: [:]) { histrogram, point in
            histrogram[point] = (histrogram[point] ?? 0) + 1
        }
        
        return histrogram.filter { $0.value > 1 }.count
    }
    
    func runPuzzle2() -> Int {
        return 0
    }
}


extension Day5 {
    struct Line {
        let start: Point
        let end: Point
        
        init(from row: Substring) {
            let points = row.components(separatedBy: " -> ")
            self.start = Point(coordinates: points[0])
            self.end   = Point(coordinates: points[1])
        }
        
        var allPoints: [Point] {
            // Just one point
            if start == end { return [start] }
            
            // Vertical line
            if start.x == end.x {
                let x = start.x
                let ys = (start.y < end.y) ? (start.y...end.y) : (end.y...start.y)
                return ys.map { y in Point(x, y) }
            }
            
            // Horizontal line
            if start.y == end.y {
                let xs = (start.x < end.x) ? (start.x...end.x) : (end.x...start.x)
                let y = start.y
                return xs.map { x in Point(x, y) }
            }
            
            // Diagonal not supported
            return []
        }
    }
    
    struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
        
        init(coordinates: String) {
            let parts = coordinates.split(separator: ",")
            self.x = Int(parts[0])!
            self.y = Int(parts[1])!
        }
    }
}
