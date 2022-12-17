public struct Day17: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let rockShapes = rockShapes
    let rockCount = 2022
    var grid = Grid(rockCount: rockCount)
    var jetPattern = JetPattern(input)

    for i in 1...rockCount {
      var rock = rockShapes[(i - 1) % rockShapes.count]
      rock.translate(2, grid.maxY + 3)

      repeat {
        let dx = jetPattern.nextXDelta()
        let pushedRock = rock.translated(dx, 0)
        if !grid.rockHasCollisions(pushedRock) {
          rock = pushedRock
        }

        let droppedRock = rock.translated(0, -1)
        if grid.rockHasCollisions(droppedRock) {
          grid.insertRock(rock)
          break // The rock has come to rest
        } else {
          rock = droppedRock
        }
      } while true
    }

    return grid.maxY
  }

  public var part2Solution: Int {
    0
  }

  struct Shape: CustomStringConvertible {
    var points: [Point]

    mutating func translate(_ dx: Int, _ dy: Int) {
      for i in points.indices {
        points[i].translate(dx, dy)
      }
    }

    func translated(_ dx: Int, _ dy: Int) -> Self {
      Shape(points: points.map { $0.translated(dx, dy) })
    }

    var description: String {
      String(points.map { "(\($0.x), \($0.y))" }.joined(by: ", "))
    }
  }

  struct Point {
    var x: Int, y: Int

    init(_ xy: (Int, Int)) {
      self.x = xy.0
      self.y = xy.1
    }

    mutating func translate(_ dx: Int, _ dy: Int) {
      x += dx
      y += dy
    }

    func translated(_ dx: Int, _ dy: Int) -> Self {
      Point((x + dx, y + dy))
    }
  }

  struct Grid {
    static let width = 7
    var maxY = 0
    var elements: [Bool]

    init(rockCount: Int) {
      self.elements = Array(
        repeating: false,
        count: Self.width * 4 * rockCount
      )
    }

    mutating func insertRock(_ rock: Shape) {
      for point in rock.points {
        elements[index(for: point)] = true
        maxY = max(maxY, point.y + 1)
      }
    }

    func rockHasCollisions(_ rock: Shape) -> Bool {
      for point in rock.points {
        if point.x < 0 || point.x >= Self.width || point.y < 0 {
          return true
        }
        if elements[index(for: point)] {
          return true
        }
      }
      return false
    }

    func index(for point: Point) -> Int { point.y * Self.width + point.x }
  }

  struct JetPattern {
    let view: String.UTF8View
    var index: String.UTF8View.Index

    init(_ input: String) {
      self.view = input.utf8
      self.index = view.startIndex
    }

    mutating func nextXDelta() -> Int {
      defer {
        index = view.index(after: index)
        if index == view.endIndex {
          index = view.startIndex
        }
      }
      switch view[index] {
      case UInt8(ascii: "<"): return -1
      case UInt8(ascii: ">"): return 1
      default: fatalError()
      }
    }
  }
}

extension Day17 {
  var rockShapes: [Shape] {
    rawShapes.map { tuples in
      Shape(points: tuples.map { Point($0) })
    }
  }

  var rawShapes: [[(Int, Int)]] {
    [
      [(0, 0), (1, 0), (2, 0), (3, 0)],           // horizontal bar
      [(1, 0), (0, 1), (1, 1), (2, 1), (1, 2)],   // cross
      [(0, 0), (1, 0), (2, 0), (2, 1), (2, 2)],   // backwards L
      [(0, 0), (0, 1), (0, 2), (0, 3)],           // vertical bar
      [(0, 0), (1, 0), (0, 1), (1, 1)],           // square
    ]
  }
}
