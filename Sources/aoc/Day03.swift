import Algorithms

public struct Day03 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    input.lines.reduce(0) { total, line in
      total + priority(of: line.halves.commonCharacter)
    }
  }

  public var part2Solution: Int {
    input.lines.chunks(ofCount: 3).reduce(0) { total, chunk in
      total + priority(of: chunk.commonCharacter)
    }
  }

  let lowercaseBaseValue = Character("a").asciiValue!
  let uppercaseBaseValue = Character("A").asciiValue!

  func priority(of c: Character) -> Int {
    let asciiValue = c.asciiValue!
    if asciiValue > lowercaseBaseValue {
      return Int(asciiValue - lowercaseBaseValue) + 1
    }
    if c.asciiValue! > uppercaseBaseValue  {
      return Int(asciiValue - uppercaseBaseValue) + 27
    }
    fatalError()
  }
}

private extension Collection<Substring> {
  var commonCharacter: Character {
    var intersection = Set(first!)
    for substring in dropFirst(1) {
      intersection.formIntersection(Set(substring))
    }
    assert(intersection.count == 1)
    return intersection.first!
  }
}

private extension StringProtocol {
  var halves: [SubSequence] {
    let halfCount = count / 2
    return [prefix(halfCount), suffix(halfCount)]
  }
}
