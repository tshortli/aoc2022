import XCTest
import aoc

final class Day14Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day14(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day14.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day14Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day14: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day14 {
    return Day14(input: """
      """)
  }
}
