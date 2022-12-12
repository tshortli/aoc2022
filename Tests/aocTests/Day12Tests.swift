import XCTest
import aoc

final class Day12Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day12(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day12.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day12Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day12: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day12 {
    return Day12(input: """
      """)
  }
}
