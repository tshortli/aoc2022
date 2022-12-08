public struct Day08: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let grid = Grid(source: input)

    var visibleIndices: Set<Int> = []
    for i in 0..<grid.size {
      var max: UInt8 = 0
      grid.enumerateRow(i) { index, ascii in
        if ascii > max {
          visibleIndices.insert(index)
          max = ascii
        }
      }

      max = 0
      grid.enumerateRow(i, forward: false) { index, ascii in
        if ascii > max {
          visibleIndices.insert(index)
          max = ascii
        }
      }

      max = 0
      grid.enumerateColumn(i) { index, ascii in
        if ascii > max {
          visibleIndices.insert(index)
          max = ascii
        }
      }

      max = 0
      grid.enumerateColumn(i, forward: false) { index, ascii in
        if ascii > max {
          visibleIndices.insert(index)
          max = ascii
        }
      }

    }
    return visibleIndices.count
  }

  public var part2Solution: Int {
    var maxScenicScore = 0
    let grid = Grid(source: input)

    for i in 0..<grid.size {
      for j in 0..<grid.size {
        maxScenicScore = max(maxScenicScore, grid.scenicScore(row: i, col: j))
      }
    }

    return maxScenicScore
  }
}

struct Grid {
  let ascii: [UInt8]
  private let rows: Int
  private let cols: Int

  init(source: String) {
    let ascii = [UInt8](source.utf8)
    self.ascii = ascii
    var cols = 0
    for (i, c) in ascii.enumerated() where c == UInt8(ascii: "\n") {
      cols = i
      break
    }
    self.cols = cols + 1
    self.rows = ascii.count / cols
  }

  var size: Int { rows }

  private func index(_ row: Int, _ col: Int) -> Int {
    cols * row + col
  }

  subscript(_ row: Int, _ col: Int) -> UInt8 {
    return ascii[index(row, col)]
  }

  func enumerateRow(
    _ row: Int,
    forward: Bool = true,
    block: (Int, UInt8) -> ()
  ) {
    let lowIndex = cols * row
    let highIndex = lowIndex + cols - 2
    let seq = forward
    ? stride(from: lowIndex, through: highIndex, by: 1)
    : stride(from: highIndex, through: lowIndex, by: -1)

    for i in seq {
      block(i, ascii[i])
    }
  }

  func enumerateColumn(
    _ col: Int,
    forward: Bool = true,
    block: (Int, UInt8) -> ()
  ) {
    let lowIndex = col
    let highIndex = lowIndex + (rows - 1) * cols
    let seq = forward
    ? stride(from: lowIndex, through: highIndex, by: cols)
    : stride(from: highIndex, through: lowIndex, by: -cols)
    for i in seq {
      block(i, ascii[i])
    }
  }

  func upSequence(row: Int, col: Int) -> StrideThrough<Int> {
    stride(from: index(row, col), through: col, by: -cols)
  }

  func downSequence(row: Int, col: Int) -> StrideThrough<Int> {
    stride(from: index(row, col), through: col + (rows - 1) * cols, by: cols)
  }

  func leftSequence(row: Int, col: Int) -> StrideThrough<Int> {
    stride(from: index(row, col), through: cols * row + cols - 2, by: 1)
  }

  func rightSequence(row: Int, col: Int) -> StrideThrough<Int> {
    stride(from: index(row, col), through: cols * row, by: -1)
  }

  func enumerate(indices: some Sequence<Int>, block: (Int, UInt8) -> Bool) {
    for i in indices {
      if !block(i, ascii[i]) {
        break
      }
    }
  }
}

extension Grid {
  func scenicScore(row i: Int, col j: Int) -> Int {
    let sequences = [
      upSequence(row: i, col: j),
      downSequence(row: i, col: j),
      leftSequence(row: i, col: j),
      rightSequence(row: i, col: j),
    ]

    var scenicScore = 1
    let value = self[i, j]
    for sequence in sequences {
      var count = 0
      enumerate(indices: sequence.dropFirst()) { index, ascii in
        count += 1
        return ascii < value
      }
      scenicScore *= count
    }
    return scenicScore
  }
}
