import XCTest
import aoc

final class Day17Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day17(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day17.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day17Tests {
  var exampleInput: String {
    """
    """
  }
}

extension Day17: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day17 {
    return Day17(input: """
      """)
  }
}
