public struct Day14: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    var simulation = Simulation(input)
    var point: Point
    repeat {
      point = simulation.addSand()
    } while point.y != simulation.floorY - 1

    return simulation.sand.count - 1 // Remove the sand that hit the floor
  }

  public var part2Solution: Int {
    var simulation = Simulation(input)
    let sourcePoint = Point(x: 500, y: 0)
    var point: Point
    repeat {
      point = simulation.addSand()
    } while point != sourcePoint

    return simulation.sand.count
  }

  struct Point: Equatable, Hashable, CustomStringConvertible {
    var x: Int, y: Int

    func down() -> Point { Point(x: x, y: y + 1) }
    func downLeft() -> Point { Point(x: x - 1, y: y + 1) }
    func downRight() -> Point { Point(x: x + 1, y: y + 1) }

    mutating func moveTowards(_ other: Point) {
      let dx = other.x - x, dy = other.y - y
      x += dx.signum()
      y += dy.signum()
    }

    var description: String { "(\(x), \(y))" }
  }

  struct Simulation {
    let rocks: Set<Point>
    let floorY: Int
    var sand: Set<Point> = []

    init(_ input: String) {
      var rocks: Set<Point> = []
      var maxY = 0
      for line in input.lines {
        var prevPoint: Point?
        var parser = Parser(line)
        while parser.peek() != nil {
          let (x, _, y) = (parser.parseInt(), parser.consume(","), parser.parseInt())
          let point = Point(x: x, y: y)
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
      self.rocks = rocks
      self.floorY = maxY + 2
    }

    mutating func addSand() -> Point {
      var point = Point(x: 500, y: 0)
      while let nextPoint = dropPoint(for: point) {
        point = nextPoint
      }
      sand.insert(point)
      return point
    }

    func dropPoint(for point: Point) -> Point? {
      let downPoint = point.down()
      if isAir(at: downPoint) { return downPoint }
      let downLeftPoint = point.downLeft()
      if isAir(at: downLeftPoint) { return downLeftPoint }
      let downRightPoint = point.downRight()
      if isAir(at: downRightPoint) { return downRightPoint }
      return nil
    }

    func isAir(at point: Point) -> Bool {
      !rocks.contains(point) && !sand.contains(point) && point.y < floorY
    }
  }
}
