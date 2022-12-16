public struct Day16: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let valves = input.lines.map { $0.parseValve() }
    for valve in valves {
      print(valve)
    }
    return 0
  }

  public var part2Solution: Int {
    0
  }

  struct Valve: CustomStringConvertible {
    let name: String
    let flowRate: Int
    let tunnels: [String]

    var description: String {
      "\(name) flowRate=\(flowRate), tunnels=\(String(tunnels.joined(by: ",")))"
    }
  }
}

private extension StringProtocol {
  func parseValve() -> Day16.Valve {
    var parser = Parser(self)
    parser.consume("Valve ")
    let name = String(parser.advance(2))
    parser.consume(" has flow rate=")
    let flowRate = parser.parseInt()
    parser.consume("; tunnel")
    if parser.peek() == "s" {
      parser.consume("s lead to valve")
    } else {
      parser.consume(" leads to valve")
    }
    parser.consume(parser.peek() == "s" ? "s " : " ") // Ugh why
    var tunnels: [String] = []
    tunnels.append(String(parser.advance(2)))
    while parser.hasMore {
      parser.consume(", ")
      tunnels.append(String(parser.advance(2)))
    }

    return Day16.Valve(name: name, flowRate: flowRate, tunnels: tunnels)
  }
}
