public struct Day18: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let points = input.lines.map { $0.parsePoint() }
    let grid = Grid(points: points)
    return points.reduce(0) {
      $0 + grid.countDisconnectedSides(of: $1)
    }
  }

  public var part2Solution: Int {
    0
  }

  struct Point {
    var x: Int, y: Int, z: Int

    func translated(x dx: Int) -> Point {
      Point(x: x + dx, y: y, z: z)
    }
    func translated(y dy: Int) -> Point {
      Point(x: x, y: y + dy, z: z)
    }
    func translated(z dz: Int) -> Point {
      Point(x: x, y: y, z: z + dz)
    }
  }

  struct Grid {
    var size: (Int, Int, Int)
    var values: [[[Bool]]]

    init(points: [Point]) {
      self.size = (
        points.map(\.x).max()! + 1,
        points.map(\.y).max()! + 1,
        points.map(\.z).max()! + 1
      )
      self.values = Array(
        repeating: Array(
          repeating: Array(
            repeating: false,
            count: size.2),
          count: size.1),
        count: size.0)

      for point in points {
        values[point.x][point.y][point.z] = true
      }
    }

    func countDisconnectedSides(of point: Point) -> Int {
      var count = 0
      if isEmpty(at: point.translated(x: 1)) { count += 1 }
      if isEmpty(at: point.translated(x: -1)) { count += 1 }
      if isEmpty(at: point.translated(y: 1)) { count += 1 }
      if isEmpty(at: point.translated(y: -1)) { count += 1 }
      if isEmpty(at: point.translated(z: 1)) { count += 1 }
      if isEmpty(at: point.translated(z: -1)) { count += 1 }
      return count
    }

    func isEmpty(at point: Point) -> Bool {
      guard point.x >= 0, point.y >= 0, point.z >= 0,
            point.x < size.0, point.y < size.1, point.z < size.2
      else { return true }
      return !values[point.x][point.y][point.z]
    }
  }
}

extension StringProtocol {
  func parsePoint() -> Day18.Point {
    var parser = Parser(self)
    let x = parser.parseInt()
    parser.consume(",")
    let y = parser.parseInt()
    parser.consume(",")
    let z = parser.parseInt()
    return Day18.Point(x: x, y: y, z: z)
  }
}
