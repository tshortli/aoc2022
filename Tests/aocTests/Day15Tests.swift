import XCTest
import aoc

final class Day15Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day15(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day15.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day15Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day15: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day15 {
    return Day15(input: """
      """)
  }
}
