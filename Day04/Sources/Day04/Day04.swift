public struct Day04 {
  let input: String
  
  public init(input: String) {
    self.input = input
  }
  
  var part1Solution: Int {
    input.lines
      .map { $0.ranges }
      .map { oneRangeIsContained($0) ? 1 : 0 }
      .reduce(0, +)
  }

  var part2Solution: Int {
    input.lines
      .map { $0.ranges }
      .map { rangesIntersect($0) ? 1 : 0 }
      .reduce(0, +)
  }

  func oneRangeIsContained(_ ranges: (ClosedRange<Int>, ClosedRange<Int>)) -> Bool {
    ranges.0.contains(ranges.1) || ranges.1.contains(ranges.0)
  }

  func rangesIntersect(_ ranges: (ClosedRange<Int>, ClosedRange<Int>)) -> Bool {
    ranges.0.intersects(ranges.1) || ranges.1.intersects(ranges.0)
  }
}

private extension ClosedRange<Int> {
  func contains(_ other: Self) -> Bool {
    contains(other.first!) && contains(other.last!)
  }

  func intersects(_ other: Self) -> Bool {
    contains(other.first!) || contains(other.last!)
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

private extension String {
  var lines: [Substring] { split(separator: "\n") }
}
