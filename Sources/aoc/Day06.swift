public struct Day06: Solver {
  let input: String
  
  public init(input: String) {
    self.input = input
  }

  func solve(forWindowSize windowSize: Int) -> Int {
    let baseCharValue = Character("a").asciiValue!
    var lastIndexForChar: [Int] = Array(repeating: Int.max, count: 26)
    var windowStartIndex = 0

    for (i, c) in input.utf8.enumerated() {
      let charValue = Int(c - baseCharValue)
      let lastIndex = lastIndexForChar[charValue]
      lastIndexForChar[charValue] = i
      if lastIndex != Int.max, i - lastIndex < windowSize {
        windowStartIndex = max(windowStartIndex, lastIndex + 1)
      } else if i + 1 - windowStartIndex == windowSize {
        return i + 1
      }
    }

    fatalError()
  }

  public var part1Solution: Int { solve(forWindowSize: 4) }

  public var part2Solution: Int { solve(forWindowSize: 14) }
}
