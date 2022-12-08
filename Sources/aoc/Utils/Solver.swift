
public protocol Solver {
  associatedtype Output

  init(input: String)
  var part1Solution: Output { get }
  var part2Solution: Output { get }
}

public protocol SolverDefaultInit: Solver {
  static func createForPuzzleInput() -> Self
}
