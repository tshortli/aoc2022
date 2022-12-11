public struct Day11: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  func monkeyBusiness(afterRounds rounds: Int, mode: WorryMode) -> Int {
    var monkeys = parseMonkeys()

    let divisorProduct = monkeys.map(\.testDivisor).reduce(1, *)

    for _ in 1...rounds {
      for i in monkeys.indices {
        let monkey = monkeys[i]
        let items = monkey.items
        monkeys[i].totalInspections += items.count
        monkeys[i].items = []
        for item in monkey.items {
          let worryLevel = mode.apply(
            to: monkey.worryLevel(for: item),
            divisorProduct: divisorProduct
          )
          let nextMonkeyIndex = monkey.nextMonkey(forWorryLevel: worryLevel)
          monkeys[nextMonkeyIndex].receive(worryLevel)
        }
      }
    }

    let sortedInspections = monkeys
      .sorted { $0.totalInspections > $1.totalInspections }
      .map(\.totalInspections)

    return sortedInspections[0] * sortedInspections[1]
  }

  public var part1Solution: Int {
    monkeyBusiness(afterRounds: 20, mode: .relief)
  }

  public var part2Solution: Int {
    monkeyBusiness(afterRounds: 10000, mode: .manage)
  }

  func parseMonkeys() -> [Monkey] {
    let lines = input.lines
    var monkeys: [Monkey] = []

    var lowIndex = 0
    while lowIndex < lines.count {
      monkeys.append(Monkey(lines[lowIndex..<(lowIndex + 6)]))
      lowIndex += 7
    }

    return monkeys
  }

  enum Operand {
    case value(Int)
    case oldValue
  }

  struct Monkey {
    var items: [Int]
    var totalInspections = 0
    let operation: Character
    let operand: Operand
    let testDivisor: Int
    let trueMonkey: Int
    let falseMonkey: Int

    init(_ lines: ArraySlice<Substring>) {
      assert(lines.count >= 6)
      self.items = lines[lines.startIndex + 1].dropFirst(18)
        .split(separator: ",")
        .map { Int($0.trimmingWhitespace)! }
      let operationString = lines[lines.startIndex + 2].dropFirst(23)
      self.operation = operationString.first!

      let operand = operationString.dropFirst(2)
      self.operand = (operand == "old") ? .oldValue : .value(Int(operand)!)
      self.testDivisor = lines[lines.startIndex + 3].parseInt(at: 21)
      self.trueMonkey =  lines[lines.startIndex + 4].parseInt(at: 29)
      self.falseMonkey = lines[lines.startIndex + 5].parseInt(at: 30)
    }

    func worryLevel(for item: Int) -> Int {
      let operand = worryLevelOperand(for: item)
      switch operation {
      case "+": return item + operand
      case "*": return item * operand
      default: fatalError()
      }
    }

    func worryLevelOperand(for item: Int) -> Int {
      switch operand {
      case .value(let value): return value
      case .oldValue: return item
      }
    }

    func nextMonkey(forWorryLevel worryLevel: Int) -> Int {
      (worryLevel % testDivisor == 0) ? trueMonkey : falseMonkey
    }

    mutating func receive(_ item: Int) {
      items.append(item)
    }
  }

  enum WorryMode {
    case relief
    case manage

    func apply(to worryLevel: Int, divisorProduct: Int) -> Int {
      switch self {
      case .relief: return worryLevel / 3
      case .manage: return worryLevel % divisorProduct
      }
    }
  }
}

private extension StringProtocol {
  var trimmingWhitespace: SubSequence {
    trimming { $0.isWhitespace }
  }

  func parseInt(at index: Int) -> Int {
    Int(dropFirst(index))!
  }
}
