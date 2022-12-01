import XCTest
@testable import Day01

final class Day01Tests: XCTestCase {
  let exampleInput = """
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
      """

  func testPart1Example() {
    let solver = Day01(input: exampleInput, elfCount: 1)
    XCTAssertEqual(solver.solution, 24000)
  }

  func testPart1() {
    let solver = Day01(input: puzzleInput, elfCount: 1)
    XCTAssertEqual(solver.solution, 69177)
  }

  func testPart2Example() {
    let solver = Day01(input: exampleInput, elfCount: 3)
    XCTAssertEqual(solver.solution, 45000)
  }

  func testPart2() {
    let solver = Day01(input: puzzleInput, elfCount: 3)
    XCTAssertEqual(solver.solution, 207456)
  }
}
