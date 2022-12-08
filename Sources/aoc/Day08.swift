public struct Day08: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let grid = Grid(source: input)
    assert(grid.rows + 1 == grid.cols)

    print("0123456789\n".utf8.map { String($0) })

    var visibleIndices: Set<Int> = []
    for i in 0..<grid.rows {
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
    0
  }
}

struct Grid {
  let ascii: [UInt8]
  let rows: Int
  let cols: Int

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
}
