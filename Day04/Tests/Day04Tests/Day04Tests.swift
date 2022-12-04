import XCTest
@testable import Day04

final class Day03Tests: XCTestCase {
  let exampleInput = """
    2-4,6-8
    2-3,4-5
    5-7,7-9
    2-8,3-7
    6-6,4-6
    2-6,4-8
    """

  func testPart1Example() throws {
    let solver = Day04(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 2)
  }

  func testPart1() throws {
    let solver = Day04(input: puzzleInput)
    XCTAssertEqual(solver.part1Solution, 487)
  }

  func testPart2Example() throws {
    let solver = Day04(input: exampleInput)
    XCTAssertEqual(solver.part2Solution, 4)
  }

  func testPart2() throws {
    let solver = Day04(input: puzzleInput)
    XCTAssertEqual(solver.part2Solution, 849)
  }
}
