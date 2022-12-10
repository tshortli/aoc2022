public struct Day10: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    var signalStrengthSum = 0

    var x = 1
    var cycle = 0
    var targetCycle = 20
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

  public var part2Solution: Int {
    0
  }
}
