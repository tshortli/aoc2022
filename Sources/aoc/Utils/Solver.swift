
public protocol Solver {
  associatedtype Output1
  associatedtype Output2

  init(input: String)
  var part1Solution: Output1 { get }
  var part2Solution: Output2 { get }
}

public protocol SolverDefaultInit: Solver {
  static func createForPuzzleInput() -> Self
}
