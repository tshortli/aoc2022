public struct Day04 {
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
  func split(on c: Character) -> (Substring, Substring) {
    let components = split(separator: c)
    return (components[0], components[1])
  }

  var range: ClosedRange<Int> {
    let components = split(on: "-")
    return Int(components.0)!...Int(components.1)!
  }

  var ranges: (ClosedRange<Int>, ClosedRange<Int>) {
    let components = split(on: ",")
    return (components.0.range, components.1.range)
  }
}
