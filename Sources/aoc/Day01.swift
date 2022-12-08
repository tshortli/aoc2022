public struct Day01: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  var caloriesPerElf: [Int] {
    var calories: [Int] = []
    var currentTotalCalories = 0
    for line in input.lines {
      if line.isEmpty {
        calories.append(currentTotalCalories)
        currentTotalCalories = 0
      } else {
        currentTotalCalories += Int(line)!
      }
    }
    calories.append(currentTotalCalories)

    return calories
  }

  public var part1Solution: Int {
    caloriesPerElf.sorted().suffix(1).reduce(0, +)
  }

  public var part2Solution: Int {
    caloriesPerElf.sorted().suffix(3).reduce(0, +)
  }
}
