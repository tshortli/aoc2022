public struct Day10: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    var x = 1
    var cycle = 0
    var targetCycle = 20
    var signalStrengthSum = 0

    for line in input.lines {
      let nextCycle = cycle + (line.first == "n" ? 1 : 2)
      let operand = (line.first == "a") ? Int(String(line.dropFirst(5)))! : 0

      if nextCycle >= targetCycle {
        signalStrengthSum += targetCycle * x
        targetCycle += 40
      }
      cycle = nextCycle
      x += operand
    }

    return signalStrengthSum
  }

  public var part2Solution: String {
    var x = 1
    var cycle = 0
    var cycleOffset = 0
    var needsNewline = false
    var image = ""
    image.reserveCapacity(256)

    for line in input.lines {
      let nextCycle = cycle + (line.first == "n" ? 1 : 2)
      let operand = (line.first == "a") ? Int(String(line.dropFirst(5)))! : 0

      let spriteRange = (x - 1)...(x + 1)
      while cycle < nextCycle {
        if needsNewline {
          image.append("\n")
          needsNewline = false
        }
        image.append(spriteRange.contains(cycle - cycleOffset) ? "#" : ".")
        cycle += 1
        if cycle == cycleOffset + 40 {
          cycleOffset += 40
          needsNewline = true
        }
      }
      x += operand
    }

    return image
  }
}
