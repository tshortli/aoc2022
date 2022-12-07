import XCTest
import aoc

final class Day07Tests: XCTestCase {
  let exampleInput = """
    """

  func testPart1Example() {
    let solver = Day07(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day07(input: puzzleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

private let puzzleInput = """
  """
