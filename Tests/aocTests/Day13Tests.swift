import XCTest
import aoc

final class Day13Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day13(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day13.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day13Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day13: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day13 {
    return Day13(input: """
      """)
  }
}
