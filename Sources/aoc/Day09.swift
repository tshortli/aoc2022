public struct Day09: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  func simulate(forKnotCount count: Int) -> Int {
    precondition(count > 1)
    var knots: [Position] = Array(repeating: Position(0, 0), count: count)

    var uniqueTailPositions: Set<Position> = []
    for line in input.lines {
      var parser = Parser(line)
      let direction = parser.advance()!
      parser.consume(" ")

      for _ in 1...parser.parseInt() {
        knots[0].move(direction)
        for i in 1..<knots.count {
          knots[i].follow(knots[i - 1])
        }
        uniqueTailPositions.insert(knots.last!)
      }
    }

    return uniqueTailPositions.count
  }

  public var part1Solution: Int {
    simulate(forKnotCount: 2)
  }

  public var part2Solution: Int {
    simulate(forKnotCount: 10)
  }

  struct Position: Hashable, Equatable {
    var x: Int, y: Int

    init(_ x: Int, _ y: Int) {
      self.x = x
      self.y = y
    }

    mutating func move(_ direction: Character) {
      switch direction {
      case "U": y += 1; break
      case "D": y -= 1; break
      case "L": x -= 1; break
      case "R": x += 1; break
      default: fatalError()
      }
    }

    mutating func follow(_ other: Self) {
      let dx = (other.x - x), dy = (other.y - y)
      if abs(dx) == 2 || abs(dy) == 2 {
        x += dx.signum()
        y += dy.signum()
      }
    }
  }
}
