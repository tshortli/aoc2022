import Algorithms

public struct Day05: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  func solve(reversed: Bool) -> String {
    // Parse input into structured data.
    var stacks: [String] = []
    var procedures: [Procedure] = []
    for line in input.lines.reversed() {
      if line.firstIndex(of: "[") != nil {
        let row = line.dropFirst(1).chunks(ofCount: 4).map { $0.first! }
        let stacksToAdd = max(0, row.count - stacks.count)
        if stacksToAdd > 0 {
          stacks.append(contentsOf: repeatElement("", count: stacksToAdd))
        }

        for (i, c) in row.enumerated() where !c.isWhitespace {
          stacks[i].append(c)
        }
      } else if (line.first == "m") {
        procedures.append(Procedure(line))
      }
    }

    // Follow procedures
    for p in procedures.reversed() {
      let crates = Array(stacks[p.source].suffix(p.count))
      stacks[p.destination].append(contentsOf: reversed ? crates.reversed() : crates)
      stacks[p.source].removeLast(p.count)
    }

    // Compute result
    return String(stacks.compactMap(\.last))
  }

  public var part1Solution: String { solve(reversed: true) }

  public var part2Solution: String { solve(reversed: false) }

  struct Procedure {
    var count: Int
    var source: Int
    var destination: Int

    init(_ s: Substring) {
      var parser = Parser(s)
      parser.consume("move ")
      self.count = parser.parseInt()
      parser.consume(" from ")
      self.source = parser.parseInt() - 1
      parser.consume(" to ")
      self.destination = parser.parseInt() - 1
    }
  }
}
