public struct Day04: Solver {
  let input: String
  
  public init(input: String) {
    self.input = input
  }
  
  public var part1Solution: Int {
    input.lines.reduce(0) { oneRangeIsContained($1.ranges) ? $0 + 1 : $0 }
  }

  public var part2Solution: Int {
    input.lines.reduce(0) { rangesIntersect($1.ranges) ? $0 + 1 : $0 }
  }

  func oneRangeIsContained(_ ranges: (ClosedRange<Int>, ClosedRange<Int>)) -> Bool {
    ranges.0.contains(ranges.1) || ranges.1.contains(ranges.0)
  }

  func rangesIntersect(_ ranges: (ClosedRange<Int>, ClosedRange<Int>)) -> Bool {
    ranges.0.overlaps(ranges.1) || ranges.1.overlaps(ranges.0)
  }
}

private extension ClosedRange<Int> {
  func contains(_ other: Self) -> Bool {
    contains(other.lowerBound) && contains(other.upperBound)
  }
}

private extension Substring {
  var ranges: (ClosedRange<Int>, ClosedRange<Int>) {
    parse { $0.parseIntRanges() }
  }
}

private extension Parser {
  mutating func parseIntRanges() -> (ClosedRange<Int>, ClosedRange<Int>) {
    let (a, _, b) = (parseIntRange(), consume(","), parseIntRange())
    return (a, b)
  }

  mutating func parseIntRange() -> ClosedRange<Int> {
    let (start, _, end) = (parseInt(), consume("-"), parseInt())
    return start...end
  }
}
