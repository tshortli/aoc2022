public struct Day11: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let lines = input.lines
    var monkeys: [Monkey] = []

    var lowIndex = 0
    for highIndex in stride(from: 7, to: lines.count, by: 7) {
      monkeys.append(Monkey(lines[lowIndex..<highIndex]))
      lowIndex = highIndex
    }

    for monkey in monkeys {
      print(monkey)
    }
    return 0
  }

  public var part2Solution: Int {
    0
  }

  enum Operand {
    case value(Int)
    case oldValue
  }

  struct Monkey {
    var items: [Int]
    let operation: Character
    let operand: Operand
    let testDivisor: Int
    let trueMonkey: Int
    let falseMonkey: Int

    init(_ lines: ArraySlice<Substring>) {
      assert(lines.count == 7)
      self.items = lines[lines.startIndex + 1].dropFirst(18)
        .split(separator: ",")
        .map { Int($0.trimmingWhitespace)! }
      let operationString = lines[lines.startIndex + 2].dropFirst(23)
      self.operation = operationString.first!

      let operandString = operationString.dropFirst(2)
      if operandString == "old" {
        self.operand = .oldValue
      } else {
        self.operand = .value(Int(operandString)!)
      }
      self.testDivisor = Int(lines[lines.startIndex + 3].dropFirst(21))!
      self.trueMonkey =  Int(lines[lines.startIndex + 4].dropFirst(29))!
      self.falseMonkey = Int(lines[lines.startIndex + 5].dropFirst(30))!
    }
  }
}

private extension StringProtocol {
  var trimmingWhitespace: SubSequence {
    trimming { $0.isWhitespace }
  }
}
