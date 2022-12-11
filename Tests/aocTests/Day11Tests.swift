import XCTest
import aoc

final class Day11Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day11(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day11.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day11Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day11: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day11 {
    return Day11(input: """
      """)
  }
}
