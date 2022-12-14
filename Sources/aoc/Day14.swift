public struct Day14: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    var simulation = Simulation(input)
    let oneAboveFloor = simulation.floorY - 1
    simulation.addSand { $0.y != oneAboveFloor }
    return simulation.sandCount - 1 // Remove the sand that hit the floor
  }

  public var part2Solution: Int {
    var simulation = Simulation(input)
    let sourcePoint = Point(x: 500, y: 0)
    simulation.addSand { $0 != sourcePoint }
    return simulation.sandCount
  }

  struct Point: Equatable, Hashable, CustomStringConvertible {
    var x: Int, y: Int

    mutating func translate(y dy: Int) { y += dy }
    mutating func translate(x dx: Int) { x += dx }

    mutating func moveTowards(_ other: Point) {
      let dx = other.x - x, dy = other.y - y
      x += dx.signum()
      y += dy.signum()
    }

    var description: String { "(\(x), \(y))" }
  }

  struct Simulation {
    let floorY: Int
    var obstacles: Set<Point> = []
    var sandCount = 0

    init(_ input: String) {
      var rocks: Set<Point> = []
      var maxY = 0
      for line in input.lines {
        var prevPoint: Point?
        var parser = Parser(line)
        while parser.peek() != nil {
          let point = parser.parsePoint()
          rocks.insert(point)

          if let prevPoint {
            var betweenPoint = prevPoint
            while betweenPoint != point {
              betweenPoint.moveTowards(point)
              rocks.insert(betweenPoint)
            }
          }
          prevPoint = point
          maxY = max(maxY, point.y)

          if parser.hasMore {
            parser.consume(" -> ")
          }
        }
      }
      self.obstacles = rocks
      self.floorY = maxY + 2
    }

    mutating func addSand() -> Point {
      var point = Point(x: 500, y: 0)
      while let nextPoint = dropSand(at: point) {
        point = nextPoint
      }
      obstacles.insert(point)
      sandCount += 1
      return point
    }

    mutating func addSand(while condition: (Point) -> Bool) {
      while condition(addSand()) {}
    }

    func dropSand(at point: Point) -> Point? {
      var droppedPoint = point
      droppedPoint.translate(y: 1)
      if isAir(at: droppedPoint) { return droppedPoint }
      droppedPoint.translate(x: -1)
      if isAir(at: droppedPoint) { return droppedPoint }
      droppedPoint.translate(x: 2)
      if isAir(at: droppedPoint) { return droppedPoint }
      return nil
    }

    func isAir(at point: Point) -> Bool {
      return point.y < floorY && !obstacles.contains(point)
    }
  }
}

private extension Parser {
  mutating func parsePoint() -> Day14.Point {
    let (x, _, y) = (parseInt(), consume(","), parseInt())
    return Day14.Point(x: x, y: y)
  }
}
