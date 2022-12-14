public struct Day14: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    simulateSand()
  }

  public var part2Solution: Int {
    0
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

  func simulateSand() -> Int {
    var simulation = Simulation(input)
    while simulation.addSand() {
    }
    return simulation.sand.count
  }

  struct Simulation {
    let rocks: Set<Point>
    let maxY: Int
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
      self.maxY = maxY
    }

    mutating func addSand() -> Bool {
      var point = Point(x: 500, y: 0)
      repeat {
        if let nextPoint = dropPoint(for: point) {
          point = nextPoint
        } else {
          sand.insert(point)
          return true
        }
      } while point.y <= maxY

      return false
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
      !rocks.contains(point) && !sand.contains(point)
    }

    func render(xRange: ClosedRange<Int>, yRange: ClosedRange<Int>) {
      for y in yRange {
        for x in xRange {
          let point = Point(x: x, y: y)
          print(string(for: point), terminator: "")
        }
        print("")
      }
      print("")
    }

    func string(for point: Point) -> String {
      if rocks.contains(point) { return "#" }
      if sand.contains(point) { return "o" }
      return "."
    }
  }
}
