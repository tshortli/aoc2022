enum CompetitionResult: Int {
  case win = 6, tie = 3, lose = 0

  init(_ c: Character) {
    switch c {
    case "X": self = .lose
    case "Y": self = .tie
    case "Z": self = .win
    default: fatalError()
    }
  }
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

  func compete(_ other: Self) -> CompetitionResult {
    if self == other { return .tie }
    return other == beats ? .win : .lose
  }

  func shape(for result: CompetitionResult) -> Self {
    switch result {
    case .win: return beats.beats
    case .tie: return self
    case .lose: return beats
    }
  }
}

public struct Day02 {
  let input: String

  public init(input: String) {
    self.input = input
  }

  func score(using block: (Substring) -> (HandShape, CompetitionResult)) -> Int {
    input.lines
      .map {
        let (shape, result) = block($0)
        return shape.rawValue + result.rawValue
      }
      .reduce(0, +)
  }

  public var part1TotalScore: Int {
    score {
      let opponentShape = HandShape($0.first!)
      let myShape = HandShape($0.last!)
      return (myShape, myShape.compete(opponentShape))
    }
  }

  public var part2TotalScore: Int {
    score {
      let opponentShape = HandShape($0.first!)
      let desiredResult = CompetitionResult($0.last!)
      return (opponentShape.shape(for: desiredResult), desiredResult)
    }
  }
}
