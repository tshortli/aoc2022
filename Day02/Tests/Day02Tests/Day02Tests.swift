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
    XCTAssertEqual(solver.totalScore, 15)
  }

  func testPart1() throws {
    let solver = Day02(input: puzzleInput)
    XCTAssertEqual(solver.totalScore, 8392)
  }
}
