public struct Day05 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: String {
    // Parse input into structured data.
    var stacksRows: [[Character?]] = []
    var procedures: [Procedure] = []
    var stackCount = 0
    for line in input.lines {
      if line.firstIndex(of: "[") != nil {
        let row = line.parseStackRow()
        stacksRows.append(row)
        stackCount = max(stackCount, row.count)
      } else if (line.first == "m") {
        procedures.append(Procedure(line))
      }
    }

    // Build initial stacks
    var stacks: [String] = Array(repeating: "", count: stackCount)
    for row in stacksRows.reversed() {
      for (i, c) in row.enumerated() where c != nil {
        stacks[i].append(c!)
      }
    }

    // Follow procedures
    for procedure in procedures {
      var source = stacks[procedure.source]
      var destination = stacks[procedure.destination]
      source.pop(count: procedure.count, onTo: &destination)
      stacks[procedure.source] = source
      stacks[procedure.destination] = destination
    }

    // Compute result
    var result = ""
    for stack in stacks {
      if let top = stack.last {
        result.append(top)
      }
    }

    return result
  }

  public var part2Solution: String {
    // Parse input into structured data.
    var stacksRows: [[Character?]] = []
    var procedures: [Procedure] = []
    var stackCount = 0
    for line in input.lines {
      if line.firstIndex(of: "[") != nil {
        let row = line.parseStackRow()
        stacksRows.append(row)
        stackCount = max(stackCount, row.count)
      } else if (line.first == "m") {
        procedures.append(Procedure(line))
      }
    }

    // Build initial stacks
    var stacks: [String] = Array(repeating: "", count: stackCount)
    for row in stacksRows.reversed() {
      for (i, c) in row.enumerated() where c != nil {
        stacks[i].append(c!)
      }
    }

    // Follow procedures
    for procedure in procedures {
      var source = stacks[procedure.source]
      var destination = stacks[procedure.destination]
      source.transfer(count: procedure.count, onTo: &destination)
      stacks[procedure.source] = source
      stacks[procedure.destination] = destination
    }

    // Compute result
    var result = ""
    for stack in stacks {
      if let top = stack.last {
        result.append(top)
      }
    }

    return result
  }
}

private struct Procedure {
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

private extension Substring {
  func parseStackRow() -> [Character?] {
    var result: [Character?] = []
    var parser = Parser(self)
    parser.skip()
    while let c = parser.advance() {
      result.append(c.isWhitespace ? nil : c)
      parser.skip(count: 3)
    }

    return result
  }
}

private extension String {
  mutating func pop(count: Int, onTo other: inout String) {
    for _ in 1...count {
      other.append(removeLast())
    }
  }

  mutating func transfer(count: Int, onTo other: inout String) {
    other.append(String(suffix(count)))
    self = String(dropLast(count))
  }
}
