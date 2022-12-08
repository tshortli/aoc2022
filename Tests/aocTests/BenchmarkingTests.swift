import XCTest
import aoc

final class BenchmarkingTests: XCTestCase {
  let iterationCount = 10

  func testPerformance() {
    var outputRows: [(String, Int, Int)] = []
    for solver in defaultSolvers {
      let part1 = benchmark { _ = solver.part1Solution }
      let part2 = benchmark { _ = solver.part2Solution }

      outputRows.append((
        String(describing: type(of: solver)),
        part1.average.microseconds,
        part2.average.microseconds
      ))
    }

    for row in outputRows {
      print("| \(row.0)  \t| \(row.1)μs\t| \(row.2)μs\t|")
    }
  }

  func benchmark(_ block: () -> ()) -> [Double] {
    var durations: [Double] = []
    for _ in 1...iterationCount {
      let start = Date()
      block()
      durations.append(Date().timeIntervalSince(start))
    }
    return durations
  }
}

extension BenchmarkingTests {
  var defaultSolvers: [any Solver] {
    [
      Day01.createForPuzzleInput(),
    ]
  }
}

extension Array<Double> {
  var average: Double { reduce(0.0, +) / Double(count) }
}

extension Double {
  var microseconds: Int { Int(self * 1000000) }
}