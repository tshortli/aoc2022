public struct Day04 {
  let input: String
  
  public init(input: String) {
    self.input = input
  }
  
  var part1Solution: Int {
    input.lines
      .map { ranges(in: $0) }
      .map { fullyContained($0) ? 1 : 0 }
      .reduce(0, +)
  }

  func ranges(in string: Substring) -> (ClosedRange<Int>, ClosedRange<Int>) {
    let parts = string.split(separator: ",")
    let range1 = parts[0].split(separator: "-")
    let range2 = parts[1].split(separator: "-")

    return (
      Int(range1[0])!...Int(range1[1])!,
      Int(range2[0])!...Int(range2[1])!
    )
  }

  func fullyContained(_ ranges: (ClosedRange<Int>, ClosedRange<Int>)) -> Bool {
    return ranges.0.contains(ranges.1.first!) && ranges.0.contains(ranges.1.last!) ||
           ranges.1.contains(ranges.0.first!) && ranges.1.contains(ranges.0.last!)
  }
}

private extension String {
  var lines: [Substring] { split(separator: "\n") }
}
