public struct Day03 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  var itemTypeSum: Int {
    input.lines
      .map { duplicateItem(in: $0.halves) }
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

  let lowercaseBaseValue = Character("a").asciiValue!
  let uppercaseBaseValue = Character("A").asciiValue!

  func priority(_ c: Character) -> Int {
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

private struct ChunksSequence<T: Sequence>: Sequence {
  var baseSequence: T
  let chunkSize: Int

  struct Iterator: IteratorProtocol {
    typealias Element = [T.Element]
    var baseIterator: T.Iterator
    let chunkSize: Int

    mutating func next() -> Element? {
      var chunk: [T.Element] = []
      for _ in 1...chunkSize {
        guard let next = baseIterator.next() else { return nil }
        chunk.append(next)
      }
      return chunk
    }
  }

  func makeIterator() -> Iterator {
    Iterator(baseIterator: baseSequence.makeIterator(), chunkSize: chunkSize)
  }
}

private extension Sequence {
  func chunks(of size: Int) -> ChunksSequence<Self> {
    ChunksSequence(baseSequence: self, chunkSize: size)
  }
}

private extension String {
  var lines: [Substring] { split(separator: "\n") }
}

private extension StringProtocol {
  var halves: [SubSequence] {
    let halfCount = count / 2
    return [prefix(halfCount), suffix(halfCount)]
  }
}
