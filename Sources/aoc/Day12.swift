public struct Day12: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let grid = Grid(source: input)
    return grid.shortestPath(from: [grid.startIndex])
  }

  public var part2Solution: Int {
    let grid = Grid(source: input)
    return grid.shortestPath(from: grid.lowestIndices())
  }

  struct Grid {
    let ascii: [UInt8]
    let startIndex: Int
    let endIndex: Int

    private let size: (Int, Int)

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
      self.size = (ascii.count / newlineIndex, newlineIndex + 1)
      self.startIndex = startIndex
      self.endIndex = endIndex
    }

    func lowestIndices() -> [Int] {
      var positions: [Int] = []
      for (i, c) in ascii.enumerated() where c == UInt8(ascii: "a") {
        positions.append(i)
      }
      return positions
    }

    private func isValidIndex(_ index: Int) -> Bool {
      guard index >= 0 && index < ascii.count else { return false }
      let row = index / size.1
      let col = index - row * size.1
      return col != size.1 - 1
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

    func eligiblePositionsAdjacent(to index: Int) -> [Int] {
      let currentValue = value(at: index)
      return [index + 1, index - 1, index + size.1, index - size.1].filter {
        guard isValidIndex($0) else { return false }
        return value(at: $0) <= currentValue + 1
      }
    }

    func shortestPath(from indices: [Int]) -> Int {
      var visited: [Bool] = Array(repeating: false, count: ascii.count)
      var distances: [Int] = Array(repeating: Int.max, count: ascii.count)

      var stack = indices
      for index in indices {
        distances[index] = 0
      }

      while !stack.isEmpty {
        let index = stack.min { distances[$0] < distances[$1] }!
        stack.removeAll(where: { $0 == index })

        let distance = distances[index]
        for adjacentIndex in eligiblePositionsAdjacent(to: index) {
          distances[adjacentIndex] = min(distance + 1, distances[adjacentIndex])
          if !visited[adjacentIndex] {
            stack.append(adjacentIndex)
          }
        }

        visited[index] = true
        if index == endIndex {
          break
        }
      }

      return distances[endIndex]
    }
  }
}
