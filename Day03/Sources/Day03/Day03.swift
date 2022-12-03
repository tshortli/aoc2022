public struct Day03 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  var itemTypeSum: Int {
    input.lines
      .map { [$0.prefix($0.count / 2), $0.suffix($0.count / 2)] }
      .map { duplicateItem(in: $0) }
      .map { priority($0) }
      .reduce(0, +)
  }

  var badgePrioritySum: Int {
    input.lines
      .chunks(of: 3)
      .map { duplicateItem(in: $0) }
      .map { priority($0) }
      .reduce(0, +)

  }

  func duplicateItem(in substrings: [Substring]) -> Character {
    var intersection = Set(substrings.first!)
    for substring in substrings[1...] {
      intersection.formIntersection(Set(substring))
    }
    assert(intersection.count == 1)
    return intersection.first!
  }

  func priority(_ c: Character) -> Int {
    if c.asciiValue! > Character("a").asciiValue! {
      return Int(c.asciiValue! - Character("a").asciiValue!) + 1
    }
    if c.asciiValue! > Character("A").asciiValue! {
      return Int(c.asciiValue! - Character("A").asciiValue!) + 27
    }
    fatalError()
  }
}

private extension Sequence {

  func chunks(of size: Int) -> [[Element]] {
    assert(size > 0)

    var chunks: [[Element]] = []
    var current: [Element] = []

    for element in self {
      current.append(element)
      if current.count == size {
        chunks.append(current)
        current.removeAll(keepingCapacity: true)
      }
    }

    return chunks
  }
}

private extension String {
  var lines: [Substring] {
    split(separator: "\n")
  }
}
