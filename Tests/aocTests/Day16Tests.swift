import XCTest
import aoc

final class Day16Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day16(input: exampleInput)
    XCTAssertEqual(solver.part1Solution, 1651)
  }

  func testPart1() {
    let solver = Day16.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 1871)
  }

  func testPart2Example() {
    let solver = Day16(input: exampleInput)
    XCTAssertEqual(solver.part2Solution, 1707)
  }

  func testPart2() {
    let solver = Day16.createForPuzzleInput()
    XCTAssertEqual(solver.part2Solution, 0)
  }
}

extension Day16Tests {
  var exampleInput: String {
    """
    Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
    Valve BB has flow rate=13; tunnels lead to valves CC, AA
    Valve CC has flow rate=2; tunnels lead to valves DD, BB
    Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
    Valve EE has flow rate=3; tunnels lead to valves FF, DD
    Valve FF has flow rate=0; tunnels lead to valves EE, GG
    Valve GG has flow rate=0; tunnels lead to valves FF, HH
    Valve HH has flow rate=22; tunnel leads to valve GG
    Valve II has flow rate=0; tunnels lead to valves AA, JJ
    Valve JJ has flow rate=21; tunnel leads to valve II
    """
  }
}

extension Day16: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day16 {
    return Day16(input: """
      Valve OJ has flow rate=0; tunnels lead to valves EW, IG
      Valve BN has flow rate=0; tunnels lead to valves SA, AA
      Valve SA has flow rate=5; tunnels lead to valves QK, LP, ZP, BN, VH
      Valve RL has flow rate=21; tunnel leads to valve AM
      Valve LR has flow rate=19; tunnel leads to valve XZ
      Valve VQ has flow rate=0; tunnels lead to valves OW, IG
      Valve ZK has flow rate=0; tunnels lead to valves EW, WC
      Valve IG has flow rate=16; tunnels lead to valves OJ, VQ
      Valve WC has flow rate=22; tunnels lead to valves VD, ZK
      Valve EW has flow rate=18; tunnels lead to valves OJ, ZK
      Valve FP has flow rate=8; tunnel leads to valve GB
      Valve JF has flow rate=23; tunnel leads to valve VD
      Valve BL has flow rate=0; tunnels lead to valves AA, ZD
      Valve BZ has flow rate=0; tunnels lead to valves QK, JA
      Valve KH has flow rate=0; tunnels lead to valves SJ, FC
      Valve FU has flow rate=0; tunnels lead to valves FC, MH
      Valve ZP has flow rate=0; tunnels lead to valves SA, FC
      Valve DZ has flow rate=0; tunnels lead to valves AA, MH
      Valve RI has flow rate=0; tunnels lead to valves LP, MH
      Valve AE has flow rate=0; tunnels lead to valves FC, AA
      Valve JA has flow rate=4; tunnels lead to valves MM, BZ, JR, ZI, QO
      Valve XP has flow rate=0; tunnels lead to valves ZD, ZI
      Valve GB has flow rate=0; tunnels lead to valves FP, SJ
      Valve AM has flow rate=0; tunnels lead to valves ZD, RL
      Valve MH has flow rate=3; tunnels lead to valves VJ, DZ, JR, FU, RI
      Valve QK has flow rate=0; tunnels lead to valves BZ, SA
      Valve AA has flow rate=0; tunnels lead to valves DZ, CZ, BL, AE, BN
      Valve MJ has flow rate=0; tunnels lead to valves VN, VH
      Valve QO has flow rate=0; tunnels lead to valves CZ, JA
      Valve MM has flow rate=0; tunnels lead to valves FC, JA
      Valve VN has flow rate=17; tunnels lead to valves FV, MJ
      Valve OW has flow rate=0; tunnels lead to valves SJ, VQ
      Valve ZI has flow rate=0; tunnels lead to valves XP, JA
      Valve VJ has flow rate=0; tunnels lead to valves KJ, MH
      Valve KQ has flow rate=0; tunnels lead to valves XZ, KJ
      Valve FC has flow rate=12; tunnels lead to valves ZP, MM, KH, AE, FU
      Valve LP has flow rate=0; tunnels lead to valves SA, RI
      Valve VD has flow rate=0; tunnels lead to valves WC, JF
      Valve JR has flow rate=0; tunnels lead to valves MH, JA
      Valve VH has flow rate=0; tunnels lead to valves SA, MJ
      Valve CZ has flow rate=0; tunnels lead to valves AA, QO
      Valve SJ has flow rate=15; tunnels lead to valves KH, FV, GB, OW
      Valve FV has flow rate=0; tunnels lead to valves VN, SJ
      Valve XZ has flow rate=0; tunnels lead to valves LR, KQ
      Valve KJ has flow rate=9; tunnels lead to valves KQ, VJ
      Valve ZD has flow rate=13; tunnels lead to valves XP, BL, AM
      """)
  }
}