import XCTest
import aoc

final class Day09Tests: XCTestCase {
  let exampleInput = """
    """

  func testPart1Example() {
    let solver = Day09(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day09.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day09: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day09 {
    Day09(input: """
      """)
  }
}
