public struct Day03 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  var itemTypeSum: Int {
    input.lines
      .map { duplicateItem(in: $0) }
      .map { priority($0) }
      .reduce(0, +)
  }

  func duplicateItem(in line: Substring) -> Character {
    let compartment1 = Set(line.prefix(line.count / 2))
    let compartment2 = Set(line.suffix(line.count / 2))
    return compartment1.intersection(compartment2).first!
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

private extension String {
  var lines: [Substring] {
    split(separator: "\n")
  }
}
