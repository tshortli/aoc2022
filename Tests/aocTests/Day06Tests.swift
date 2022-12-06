import XCTest
import aoc

final class Day06Tests: XCTestCase {
  let exampleInput = """
    """

  func testPart1Example() {
    let solver = Day06(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, "")
  }

  func testPart1() {
    let solver = Day06(input: puzzleInput)
    XCTAssertEqual(solver.part1Solution, "")
  }
}

fileprivate let puzzleInput = """
  """
