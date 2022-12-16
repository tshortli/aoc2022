import XCTest
import aoc

final class Day16Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day16(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day16.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day16Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day16: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day16 {
    return Day16(input: """
      """)
  }
}
