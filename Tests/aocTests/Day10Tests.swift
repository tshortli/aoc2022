import XCTest
import aoc

final class Day10Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day10(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 13140)
  }

  func testPart1() {
    let solver = Day10.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 10760)
  }

  func testPart2Example() {
    let solver = Day10(input: exampleInput)
    XCTAssertEqual(solver.part2Solution, """
      ##..##..##..##..##..##..##..##..##..##..
      ###...###...###...###...###...###...###.
      ####....####....####....####....####....
      #####.....#####.....#####.....#####.....
      ######......######......######......####
      #######.......#######.......#######.....
      """)
  }

  func testPart2() {
    let solver = Day10.createForPuzzleInput()
    XCTAssertEqual(solver.part2Solution, """
      ####.###...##..###..#..#.####..##..#..#.
      #....#..#.#..#.#..#.#..#.#....#..#.#..#.
      ###..#..#.#....#..#.####.###..#....####.
      #....###..#.##.###..#..#.#....#.##.#..#.
      #....#....#..#.#....#..#.#....#..#.#..#.
      #....#.....###.#....#..#.#.....###.#..#.
      """)
  }
}

extension Day10Tests {
  var exampleInput: String {
    """
    addx 15
    addx -11
    addx 6
    addx -3
    addx 5
    addx -1
    addx -8
    addx 13
    addx 4
    noop
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx -35
    addx 1
    addx 24
    addx -19
    addx 1
    addx 16
    addx -11
    noop
    noop
    addx 21
    addx -15
    noop
    noop
    addx -3
    addx 9
    addx 1
    addx -3
    addx 8
    addx 1
    addx 5
    noop
    noop
    noop
    noop
    noop
    addx -36
    noop
    addx 1
    addx 7
    noop
    noop
    noop
    addx 2
    addx 6
    noop
    noop
    noop
    noop
    noop
    addx 1
    noop
    noop
    addx 7
    addx 1
    noop
    addx -13
    addx 13
    addx 7
    noop
    addx 1
    addx -33
    noop
    noop
    noop
    addx 2
    noop
    noop
    noop
    addx 8
    noop
    addx -1
    addx 2
    addx 1
    noop
    addx 17
    addx -9
    addx 1
    addx 1
    addx -3
    addx 11
    noop
    noop
    addx 1
    noop
    addx 1
    noop
    noop
    addx -13
    addx -19
    addx 1
    addx 3
    addx 26
    addx -30
    addx 12
    addx -1
    addx 3
    addx 1
    noop
    noop
    noop
    addx -9
    addx 18
    addx 1
    addx 2
    noop
    noop
    addx 9
    noop
    noop
    noop
    addx -1
    addx 2
    addx -37
    addx 1
    addx 3
    noop
    addx 15
    addx -21
    addx 22
    addx -6
    addx 1
    noop
    addx 2
    addx 1
    noop
    addx -10
    noop
    noop
    addx 20
    addx 1
    addx 2
    addx 2
    addx -6
    addx -11
    noop
    noop
    noop
    """
  }
}

extension Day10: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day10 {
    return Day10(input: """
      addx 1
      addx 4
      noop
      noop
      addx 30
      addx -24
      addx -1
      noop
      addx 4
      addx 1
      addx 5
      addx -4
      addx 5
      addx 4
      addx 1
      noop
      addx 5
      addx -1
      addx 5
      addx 3
      noop
      addx -38
      addx 9
      addx -4
      noop
      addx 3
      noop
      addx 2
      addx 3
      noop
      addx 2
      addx 3
      noop
      addx 2
      addx 3
      noop
      addx 2
      addx -17
      addx 22
      addx -2
      addx 5
      addx 2
      addx 3
      addx -2
      addx -36
      noop
      addx 5
      noop
      addx 3
      noop
      addx 2
      addx -5
      noop
      addx 10
      addx 3
      addx -2
      addx 3
      addx 2
      addx 4
      noop
      noop
      noop
      noop
      addx 3
      noop
      noop
      addx 7
      addx 1
      noop
      noop
      addx -38
      addx 39
      addx -32
      noop
      noop
      noop
      addx 5
      addx 2
      addx -1
      addx 4
      noop
      addx 5
      addx -2
      addx 5
      addx 2
      addx -26
      addx 31
      addx -2
      addx 4
      addx 3
      addx -18
      addx 19
      addx -38
      addx 7
      noop
      noop
      addx 34
      addx -39
      addx 8
      addx 5
      addx 2
      addx 10
      addx -5
      addx -2
      addx 5
      addx 2
      addx 11
      addx -6
      noop
      addx 3
      noop
      addx 2
      addx 3
      addx -2
      addx -38
      noop
      noop
      noop
      addx 5
      addx 11
      noop
      addx -3
      noop
      noop
      noop
      addx 2
      noop
      addx -11
      addx 16
      noop
      addx 3
      addx 2
      addx 8
      noop
      noop
      noop
      noop
      noop
      addx 4
      addx 3
      noop
      addx -20
      noop
      """)
  }
}
