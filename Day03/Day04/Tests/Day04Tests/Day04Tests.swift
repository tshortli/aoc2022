import XCTest
@testable import Day04

final class Day03Tests: XCTestCase {
  let exampleInput = """
    """

  func testPart1Example() throws {
    let solver = Day04(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 42)
  }

  func testPart1() throws {
    let solver = Day04(input: puzzleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }
}
