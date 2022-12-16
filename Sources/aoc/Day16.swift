public struct Day16: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let valves = input.lines
      .map { $0.parseValve() }
      .reduce(into: [:]) { dict, valve in
        dict[valve.name] = valve
      }

    let flowValves = valves.values.filter { $0.flowRate > 0 }.map(\.name)

    let map = ValveMap(valves: valves)
    return map.bestFlow(
      currentValve: "AA",
      remainingMin: 30,
      flowPerMin: 0,
      totalFlow: 0,
      remainingValveNames: flowValves
    )
  }

  public var part2Solution: Int {
    0
  }

  struct ValveMap {
    let valves: [String: Valve]
    let distancesByValveName: [String: [String: Int]]

    init(valves: [String: Valve]) {
      self.valves = valves
      self.distancesByValveName = Self.distancesByValveName(valves: valves)
    }

    static func distancesByValveName(
      valves: [String: Valve]
    ) -> [String: [String: Int]] {
      var distancesByValveName: [String: [String: Int]] = [:]
      for fromValve in valves.values {
        var distances: [String: Int] = [:]
        var queue: [(String, Int)] = fromValve.tunnels.map { ($0, 1) }
        var queueIndex = 0

        while queueIndex < queue.count {
          let (toValveName, distance) = queue[queueIndex]
          distances[toValveName] = distance
          let toValve = valves[toValveName]!
          for tunnel in toValve.tunnels {
            if distances[tunnel] == nil && tunnel != fromValve.name {
              queue.append((tunnel, distance + 1))
            }
          }
          queueIndex += 1
        }

        distancesByValveName[fromValve.name] = distances
      }
      return distancesByValveName
    }

    func bestFlow(
      currentValve: String,
      remainingMin: Int,
      flowPerMin: Int,
      totalFlow: Int,
      remainingValveNames: [String]
    ) -> Int {
      let distances = distancesByValveName[currentValve]!
      var maxFlow = Int.min
      for valveName in remainingValveNames {
        let minToOpen = distances[valveName]! + 1
        let newRemainingMin = remainingMin - minToOpen
        if newRemainingMin < 0 { continue }

        let newFlowPerMin = flowPerMin + valves[valveName]!.flowRate
        let newTotalFlow = totalFlow + flowPerMin * minToOpen
        let newRemainingValveNames = remainingValveNames.filter { $0 != valveName }
        maxFlow = max(maxFlow, bestFlow(
          currentValve: valveName,
          remainingMin: newRemainingMin,
          flowPerMin: newFlowPerMin,
          totalFlow: newTotalFlow,
          remainingValveNames: newRemainingValveNames
        ))
      }

      if maxFlow > Int.min {
        return maxFlow
      }
      return totalFlow + flowPerMin * remainingMin
    }
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
