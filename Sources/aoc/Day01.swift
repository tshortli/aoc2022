public struct Day01 {
  let input: String
  let elfCount: Int

  public init(input: String, elfCount: Int) {
    assert(elfCount > 0)

    self.input = input
    self.elfCount = elfCount
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

  public var solution: Int {
    caloriesPerElf.sorted().suffix(elfCount).reduce(0, +)
  }
}
