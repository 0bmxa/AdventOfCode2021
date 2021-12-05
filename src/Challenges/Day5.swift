//
//  Day5.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 2021-12-05.
//

import Foundation

struct Day5: Challenge {
    var puzzle1SampleResult: Int? = 5
    var puzzle2SampleResult: Int? = 12
    
    let input: [Substring]
    
    init(testing: Bool) {
        self.input = Self.getInput(sampleData: testing)
    }
    
    func runPuzzle1() -> Int {
        let points = self.input.flatMap { row -> [Point] in
            let line = Line(from: row)
            guard [.point, .horizonal, .vertical].contains(line.direction) else { return [] }
            return line.allPoints
        }
        
        let histrogram = points.reduce(into: [:]) { histrogram, point in
            histrogram[point] = (histrogram[point] ?? 0) + 1
        }
        
        return histrogram.filter { $0.value > 1 }.count
    }
    
    func runPuzzle2() -> Int {
        let points = self.input.flatMap { row -> [Point] in
            let line = Line(from: row)
            guard line.direction != .other else { return [] }
            return line.allPoints
        }
        
        let histrogram = points.reduce(into: [:]) { histrogram, point in
            histrogram[point] = (histrogram[point] ?? 0) + 1
        }
        
        return histrogram.filter { $0.value > 1 }.count
    }
}


extension Day5 {
    struct Line {
        enum Direction {
            case point
            case horizonal
            case vertical
            case diagonal45
            case other
        }
        
        let start: Point
        let end: Point
        
        init(from row: Substring) {
            let points = row.components(separatedBy: " -> ")
            self.start = Point(coordinates: points[0])
            self.end   = Point(coordinates: points[1])
        }
        
        var length: Int {
            return max(abs(end.x - start.x), abs(end.y - start.y)) + 1
        }
        
        var direction: Direction {
            if start == end {
                return .point
            } else if start.x == end.x {
                return .vertical
            } else if start.y == end.y {
                return .horizonal
            } else if abs(start.x - end.x) == abs(start.y - end.y) {
                return .diagonal45
            }
            return .other
        }
        
        var allPoints: [Point] {
            switch self.direction {
            case .point:
                return [start]
                
            case .vertical:
                let x = start.x
                let step = (start.y < end.y) ? 1 : -1
                return (0..<length).map { i in Point(x, start.y + step * i) }

            case .horizonal:
                let y = start.y
                let step = (start.x < end.x) ? 1 : -1
                return (0..<length).map { i in Point(start.x + step * i, y) }

            case .diagonal45:
                let xStep = (start.x < end.x) ? 1 : -1
                let yStep = (start.y < end.y) ? 1 : -1
                return (0..<length).map { i in Point(start.x + xStep * i, start.y + yStep * i) }

            default:
                return []
            }
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
