import XCTest
@testable import Day03

final class Day03Tests: XCTestCase {
  let exampleInput = """
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    """
  
  func testPart1Example() throws {
    let solver = Day03(input: exampleInput)
    XCTAssertEqual(solver.itemTypeSum, 157)
  }

  func testPart1() throws {
    let solver = Day03(input: puzzleInput)
    XCTAssertEqual(solver.itemTypeSum, 7811)
  }
}
