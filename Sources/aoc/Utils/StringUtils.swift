extension String {
  var lines: [Substring] {
    split(separator: "\n", omittingEmptySubsequences: false)
  }
}

extension StringProtocol {
  func parse<T>(_ handler: (inout Parser<Self>) -> T) -> T {
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

  @inline(__always)
  mutating func advance() -> Character? {
    guard index < endIndex else { return nil }
    defer { index = string.index(after: index) }
    return string[index]
  }

  @inline(__always)
  mutating func advance(while condition: (Character) -> Bool) {
    while index < endIndex && condition(string[index]) {
      index = string.index(after: index)
    }
  }

  public mutating func consume(_ c: Character) {
    if advance() != c { fatalError() }
  }

  public mutating func parseInt() -> Int {
    let start = index
    advance { $0.isNumber }
    return Int(String(string[start..<index]))!
  }
}
