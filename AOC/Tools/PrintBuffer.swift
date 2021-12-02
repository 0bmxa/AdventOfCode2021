//
//  BufferedPrint.swift
//  AdventOfCode2021
//
//  Created by 0bmxa on 01.12.21.
//

import Foundation

enum PrintBuffer {
    private static var buffer = ""
    private static var callCount = 0
    
    static func add(_ message: String) {
        self.buffer = message
        self.callCount += 1
    }
    
    static func flush() {
        Swift.print("PrintBuffer used \(self.callCount) times, last value: \(self.buffer)")
        self.buffer = ""
        self.callCount = 0
    }
}

// Ensure regular `print()` isn't used accidentially.
@available(*, unavailable)
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {}
