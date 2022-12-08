import XCTest
import aoc

final class Day08Tests: XCTestCase {
  let exampleInput = """
    """

  func testPart1Example() {
    let solver = Day08(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 0)
  }

  func testPart1() {
    let solver = Day08.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 0)
  }
}

extension Day08: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day08 {
    Day08(input: """
      """)
  }
}
