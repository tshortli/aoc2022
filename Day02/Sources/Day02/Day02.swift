enum CompetitionResult: Int {
  case win = 6, tie = 3, lose = 0
}

enum HandShape: Int {
  case rock = 1, paper = 2, scissors = 3

  init(_ c: Character) {
    switch c {
    case "A", "X": self = .rock
    case "B", "Y": self = .paper
    case "C", "Z": self = .scissors
    default: fatalError()
    }
  }

  var beats: Self {
    switch self {
    case .rock: return .scissors
    case .paper: return .rock
    case .scissors: return .paper
    }
  }

  func compare(_ other: Self) -> CompetitionResult {
    if self == other { return .tie }
    return other == beats ? .win : .lose
  }
}

public struct Day02 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  func lineScore(_ line: some StringProtocol) -> Int {
    let opponentShape = HandShape(line.first!)
    let myShape = HandShape(line.last!)
    return myShape.rawValue + myShape.compare(opponentShape).rawValue
  }

  var totalScore: Int {
    input.lines
      .map { lineScore($0) }
      .reduce(0, +)
  }
}

private extension String {
  var lines: [Substring] { split(separator: "\n") }
}
