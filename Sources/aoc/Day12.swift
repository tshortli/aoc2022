public struct Day12: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    Grid(source: input).shortestPath()
  }

  public var part2Solution: Int {
    0
  }

  struct Position: CustomStringConvertible, Equatable, Hashable {
    let row: Int
    let col: Int

    init(_ row: Int, _ col: Int) {
      self.row = row
      self.col = col
    }

    var adjacentPositions: [Position] {
      [
        Self(row - 1, col),
        Self(row + 1, col),
        Self(row, col - 1),
        Self(row, col + 1),
      ]
    }

    var description: String { "(\(row), \(col))" }
  }

  struct Grid {
    let ascii: [UInt8]
    let start: Position
    let end: Position

    private let size: Position

    init(source: String) {
      let ascii = [UInt8](source.utf8)
      self.ascii = ascii
      var newlineIndex = Int.max, startIndex = Int.max, endIndex = Int.max
      for (i, c) in ascii.enumerated() {
        switch c {
        case UInt8(ascii: "\n"): newlineIndex = min(newlineIndex, i)
        case UInt8(ascii: "S"): startIndex = min(startIndex, i)
        case UInt8(ascii: "E"): endIndex = min(endIndex, i)
        default: break
        }
      }
      self.size = Position(ascii.count / newlineIndex, newlineIndex + 1)
      let startRow = startIndex / self.size.col
      self.start = Position(startRow, startIndex - startRow * self.size.col)
      let endRow = endIndex / self.size.col
      self.end = Position(endRow, endIndex - endRow * self.size.col)
    }

    private func index(at position: Position) -> Int? {
      if position.row < 0 || position.row > size.row - 1 ||
          position.col < 0 || position.col > size.col - 2 {
        return nil
      }
      return position.row * size.col + position.col
    }

    private func value(at index: Int) -> UInt8 {
      let ascii = ascii[index]
      switch ascii {
      case UInt8(ascii: "S"): return 0
      case UInt8(ascii: "E"): return 25
      case UInt8(ascii: "a")...UInt8(ascii: "z"):
        return ascii - UInt8(ascii: "a")
      default: fatalError()
      }
    }

    func eligiblePositionsAdjacent(to position: Position) -> [Position] {
      let currentValue = value(at: index(at: position)!)

      return position.adjacentPositions.filter {
        guard let index = index(at: $0) else { return false }
        return value(at: index) <= currentValue + 1
      }
    }

    func shortestPath() -> Int {
      var visited: [Bool] = Array(repeating: false, count: ascii.count)
      var distances: [Int] = Array(repeating: Int.max, count: ascii.count)

      var stack = [start]
      distances[index(at: start)!] = 0

      while let position = stack.min(by: { distances[index(at: $0)!] < distances[index(at: $1)!]}) {
        stack.removeAll(where: { $0 == position })
        let currentIndex = index(at: position)!
        if visited[currentIndex] {
          continue
        }

        let distance = distances[currentIndex]
        for adjacentPosition in eligiblePositionsAdjacent(to: position) {
          let adjacentIndex = index(at: adjacentPosition)!
          distances[adjacentIndex] = min(distance + 1, distances[adjacentIndex])
          if !visited[adjacentIndex] {
            stack.append(adjacentPosition)
          }
        }

        visited[index(at: position)!] = true
        if position == end {
          break
        }
      }

      return distances[index(at: end)!]
    }
  }
}
