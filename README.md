# Advent of Code 2021

## Run

Requires Xcode.

1. Open `AdventOfCode2021.xcodeproj`
2. Run one of the two targets.

### Targets

|                   | Target `run`            | Target `perf` |
|---|---|---|
| **Purpose**       | Development & debugging | Performance measuring               |
| **Optimization**  | none                    | `-Ofast`                            |
| **Runs**          | newest challenge, once  | selected challenge, 100.000 rounds  |
| **Output**        | Result                  | Total & average timing; Result      |



## Project structure

```bash
├─ src
|  |
|  |   # Main puzzle code
│  ├─ Challenges
│  │  ├── Day1.swift
│  │  ├── Day2.swift
|  |  └── ...
|  |
|  |  # Project specifics (input access; challenge list)
│  ├─ AOC
│  │  ├── config.plist
│  │  └── AOC.swift
│  |
│  |   # Targets
│  ├─ run
|  │  └── main.swift
│  ├─ perf
│  │  └── main.swift
|  |
|  |   # Supporting tools
│  └─ Tools
│     └── PrintBuffer.swift
│
│   # Daily input
└─ input
   ├── Day1.txt
   ├── Day2.txt
   └── ...
```
