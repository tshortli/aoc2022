import Algorithms

public struct Day06 {
  let input: String
  
  public init(input: String) {
    self.input = input
  }
  
  public var part1Solution: Int {
    for (i, window) in input.windows(ofCount: 4).enumerated() {
      if Set(window).count == 4 {
        return i + 4
      }
    }
    return input.count
  }
}
