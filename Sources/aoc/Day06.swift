import Algorithms

public struct Day06 {
  let input: String
  
  public init(input: String) {
    self.input = input
  }

  func solve(forWindowSize windowSize: Int) -> Int {
    for (i, window) in input.windows(ofCount: windowSize).enumerated() {
      if Set(window).count == windowSize {
        return i + windowSize
      }
    }
    fatalError()
  }
  
  public var part1Solution: Int { solve(forWindowSize: 4) }

  public var part2Solution: Int { solve(forWindowSize: 14) }
}
