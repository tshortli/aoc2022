import XCTest
import aoc

final class Day15Tests: XCTestCase {
  func testPart1Example() {
    let solver = Day15(input: exampleInput)
    XCTAssertEqual(solver.countNoBeacon(row: 10), 26)
  }

  func testPart1() {
    let solver = Day15.createForPuzzleInput()
    XCTAssertEqual(solver.part1Solution, 4665948)
  }

  func testPart2Example() {
    let solver = Day15(input: exampleInput)
    XCTAssertEqual(solver.distressBeaconTuningFrequency(bound: 20), 56000011)
  }

  func testPart2() {
    let solver = Day15.createForPuzzleInput()
    XCTAssertEqual(solver.part2Solution, 13543690671045)
  }
}

extension Day15Tests {
  var exampleInput: String {
    """
    Sensor at x=2, y=18: closest beacon is at x=-2, y=15
    Sensor at x=9, y=16: closest beacon is at x=10, y=16
    Sensor at x=13, y=2: closest beacon is at x=15, y=3
    Sensor at x=12, y=14: closest beacon is at x=10, y=16
    Sensor at x=10, y=20: closest beacon is at x=10, y=16
    Sensor at x=14, y=17: closest beacon is at x=10, y=16
    Sensor at x=8, y=7: closest beacon is at x=2, y=10
    Sensor at x=2, y=0: closest beacon is at x=2, y=10
    Sensor at x=0, y=11: closest beacon is at x=2, y=10
    Sensor at x=20, y=14: closest beacon is at x=25, y=17
    Sensor at x=17, y=20: closest beacon is at x=21, y=22
    Sensor at x=16, y=7: closest beacon is at x=15, y=3
    Sensor at x=14, y=3: closest beacon is at x=15, y=3
    Sensor at x=20, y=1: closest beacon is at x=15, y=3
    """
  }
}

extension Day15: SolverDefaultInit {
  public static func createForPuzzleInput() -> Day15 {
    return Day15(input: """
      Sensor at x=3923513, y=2770279: closest beacon is at x=3866712, y=2438950
      Sensor at x=675683, y=3223762: closest beacon is at x=-224297, y=2997209
      Sensor at x=129453, y=2652332: closest beacon is at x=92656, y=2629486
      Sensor at x=3906125, y=2154618: closest beacon is at x=3866712, y=2438950
      Sensor at x=65723, y=902062: closest beacon is at x=92656, y=2629486
      Sensor at x=3137156, y=2876347: closest beacon is at x=2907507, y=3100765
      Sensor at x=32848, y=2676435: closest beacon is at x=92656, y=2629486
      Sensor at x=3272472, y=3445147: closest beacon is at x=2907507, y=3100765
      Sensor at x=2926008, y=128948: closest beacon is at x=3089364, y=-501737
      Sensor at x=2975, y=2769838: closest beacon is at x=92656, y=2629486
      Sensor at x=3540455, y=2469135: closest beacon is at x=3866712, y=2438950
      Sensor at x=3674809, y=2062166: closest beacon is at x=3719980, y=2000000
      Sensor at x=3693706, y=2027384: closest beacon is at x=3719980, y=2000000
      Sensor at x=3869683, y=2291983: closest beacon is at x=3866712, y=2438950
      Sensor at x=2666499, y=2796436: closest beacon is at x=2650643, y=2489479
      Sensor at x=492, y=2601991: closest beacon is at x=92656, y=2629486
      Sensor at x=2710282, y=3892347: closest beacon is at x=2907507, y=3100765
      Sensor at x=28974, y=3971342: closest beacon is at x=-224297, y=2997209
      Sensor at x=3990214, y=2399722: closest beacon is at x=3866712, y=2438950
      Sensor at x=3853352, y=1009020: closest beacon is at x=3719980, y=2000000
      Sensor at x=1231833, y=3999338: closest beacon is at x=1313797, y=4674300
      Sensor at x=2083669, y=875035: closest beacon is at x=1369276, y=-160751
      Sensor at x=1317274, y=2146819: closest beacon is at x=2650643, y=2489479
      Sensor at x=3712875, y=2018770: closest beacon is at x=3719980, y=2000000
      Sensor at x=963055, y=23644: closest beacon is at x=1369276, y=-160751
      Sensor at x=3671967, y=64054: closest beacon is at x=3089364, y=-501737
      Sensor at x=3109065, y=2222392: closest beacon is at x=2650643, y=2489479
      Sensor at x=3218890, y=1517419: closest beacon is at x=3719980, y=2000000
      Sensor at x=3856777, y=3987650: closest beacon is at x=4166706, y=3171774
      Sensor at x=1912696, y=3392788: closest beacon is at x=2907507, y=3100765
      Sensor at x=3597620, y=3100104: closest beacon is at x=4166706, y=3171774
      """)
  }
}
