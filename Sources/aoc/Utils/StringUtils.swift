extension String {
  var lines: [Substring] {
    split(separator: "\n", omittingEmptySubsequences: false)
  }
}

extension StringProtocol {
  public func parse<T>(_ handler: (inout Parser<Self>) -> T) -> T {
    var parser = Parser(self)
    return handler(&parser)
  }
}

public struct Parser<T: StringProtocol> {
  let string: T
  let endIndex: T.Index
  var index: T.Index

  public init(_ string: T) {
    self.string = string
    self.endIndex = string.endIndex
    self.index = string.startIndex
  }

  public func peek() -> Character? {
    guard index < endIndex else { return nil }
    return string[index]
  }

  public mutating func advance() -> Character? {
    guard index < endIndex else { return nil }
    defer { index = string.index(after: index) }
    return string[index]
  }

  public mutating func advance(
    while condition: (Character) -> Bool
  ) -> T.SubSequence {
    let start = index
    while index < endIndex && condition(string[index]) {
      index = string.index(after: index)
    }
    return string[start..<index]
  }

  public mutating func skip() {
    _ = advance()
  }

  public mutating func skip(while condition: (Character) -> Bool) {
    _ = advance(while: condition)
  }

  public mutating func consume(_ c: Character) {
    if advance() != c { fatalError() }
  }

  public mutating func parseInt() -> Int {
    return Int(String(advance { $0.isNumber }))!
  }
}

private extension Int {

}
