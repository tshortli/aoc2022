public struct Day09: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    var head: Position = Position(0, 0)
    var tail: Position = Position(0, 0)

    var uniqueTailPositions: Set<Position> = []
    for line in input.lines {
      var parser = Parser(line)
      let direction = parser.advance()!
      parser.consume(" ")
      let count = parser.parseInt()

      for _ in 1...count {
        head.move(direction)
        tail.follow(head)
        uniqueTailPositions.insert(tail)
      }
    }

    return uniqueTailPositions.count
  }

  public var part2Solution: Int {
    var knots: [Position] = Array(repeating: Position(0, 0), count: 10)

    var uniqueTailPositions: Set<Position> = []
    for line in input.lines {
      var parser = Parser(line)
      let direction = parser.advance()!
      parser.consume(" ")
      let count = parser.parseInt()

      for _ in 1...count {
        knots[0].move(direction)
        for i in 1..<knots.count {
          knots[i].follow(knots[i - 1])
        }
        uniqueTailPositions.insert(knots.last!)
      }
    }

    return uniqueTailPositions.count
  }
}

struct Position: Hashable, Equatable {
  var x: Int
  var y: Int

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
    let dx = other.x - x, dy = other.y - y

    if dy == 0 {
      if dx > 1 {
        x += 1
      } else if dx < -1 {
        x -= 1
      }
    }

    if dx == 0 {
      if dy > 1 {
        y += 1
      } else if dy < -1 {
        y -= 1
      }
    }

    if dx != 0 && dy != 0 && (abs(dx) > 1 || abs(dy) > 1) {
      x += (dx > 0) ? 1 : -1
      y += (dy > 0) ? 1 : -1
    }
  }
}

