import XCTest
@testable import Day02

final class Day02Tests: XCTestCase {
  let exampleInput = """
      A Y
      B X
      C Z
      """

  func testPart1Example() throws {
    let solver = Day02(input: exampleInput)
    XCTAssertEqual(solver.part1TotalScore, 15)
  }

  func testPart1() throws {
    let solver = Day02(input: puzzleInput)
    XCTAssertEqual(solver.part1TotalScore, 8392)
  }

  func testPart2Example() throws {
    let solver = Day02(input: exampleInput)
    XCTAssertEqual(solver.part2TotalScore, 12)
  }

  func testPart2() throws {
    let solver = Day02(input: puzzleInput)
    XCTAssertEqual(solver.part2TotalScore, 10116)
  }
}
