import XCTest
import aoc

final class Day05Tests: XCTestCase {
  let exampleInput = """
        [D]
    [N] [C]
    [Z] [M] [P]
     1   2   3

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
    """

  func testPart1Example() {
    let solver = Day05(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, "CMZ")
  }

  func testPart1() {
    let solver = Day05(input: puzzleInput)
    XCTAssertEqual(solver.part1Solution, "")
  }
}

fileprivate let puzzleInput = """

  """
