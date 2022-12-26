import Algorithms

public struct Day16: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let map = ValveMap(valvesByID: valvesByID)
    let remainingIDs = map.valvesByID.values
      .filter { $0.flowRate > 0 }
      .map(\.id)

    return map.bestFlow(
      currentID: Valve.ID(from: "AA"),
      remainingMin: 30,
      remainingIDs: remainingIDs
    )
  }

  public var part2Solution: Int {
    let map = ValveMap(valvesByID: valvesByID)
    let allRemainingIDs = map.valvesByID.values
      .filter { $0.flowRate > 0 }
      .map(\.id)

    let startID = Valve.ID(from: "AA")
    var maxFlow = Int.min
    for count in 1...(allRemainingIDs.count / 2) {
      for elephantIDs in allRemainingIDs.combinations(ofCount: count) {
        let usedIDsSet = Set(elephantIDs)
        let humanIDs = allRemainingIDs.filter { !usedIDsSet.contains($0) }

        let elephantFlow = map.bestFlow(
          currentID: startID,
          remainingMin: 26,
          remainingIDs: elephantIDs
        )

        let humanFlow = map.bestFlow(
          currentID: startID,
          remainingMin: 26,
          remainingIDs: humanIDs
        )

        maxFlow = max(maxFlow, elephantFlow + humanFlow)
      }
    }

    return maxFlow
  }

  var valvesByID: [Valve.ID: Valve] {
    input.lines
      .map { Valve(from: $0) }
      .reduce(into: [:]) { dict, valve in
        dict[valve.id] = valve
      }
  }

  struct ValveMap {
    let valvesByID: [Valve.ID: Valve]
    let distancesByID: [Valve.ID: [Valve.ID: Int]]

    init(valvesByID: [Valve.ID: Valve]) {
      self.valvesByID = valvesByID
      self.distancesByID = Self.distancesByValveID(valves: valvesByID)
    }

    static func distancesByValveID(
      valves: [Valve.ID: Valve]
    ) -> [Valve.ID: [Valve.ID: Int]] {
      var distancesByValveName: [Valve.ID: [Valve.ID: Int]] = [:]
      for fromValve in valves.values {
        var distances: [Valve.ID: Int] = [:]
        var queue: [(Valve.ID, Int)] = fromValve.tunnels.map { ($0, 1) }
        var queueIndex = 0

        while queueIndex < queue.count {
          let (toValveID, distance) = queue[queueIndex]
          distances[toValveID] = distance
          let toValve = valves[toValveID]!
          for tunnel in toValve.tunnels {
            if distances[tunnel] == nil && tunnel != fromValve.id {
              queue.append((tunnel, distance + 1))
            }
          }
          queueIndex += 1
        }

        distancesByValveName[fromValve.id] = distances
      }
      return distancesByValveName
    }

    func bestFlow(
      currentID: Valve.ID,
      remainingMin: Int,
      remainingIDs: some Sequence<Valve.ID>,
      flowPerMin: Int = 0,
      totalFlow: Int = 0
    ) -> Int {
      let distances = distancesByID[currentID]!
      var maxFlow = Int.min
      for id in remainingIDs {
        let minToOpen = distances[id]! + 1
        let newRemainingMin = remainingMin - minToOpen
        if newRemainingMin < 0 { continue }

        let newFlowPerMin = flowPerMin + valvesByID[id]!.flowRate
        let newTotalFlow = totalFlow + flowPerMin * minToOpen
        let newRemainingIDs = remainingIDs.filter { $0 != id }

        maxFlow = max(maxFlow, bestFlow(
          currentID: id,
          remainingMin: newRemainingMin,
          remainingIDs: newRemainingIDs,
          flowPerMin: newFlowPerMin,
          totalFlow: newTotalFlow
        ))
      }

      if maxFlow > Int.min {
        return maxFlow
      }
      return totalFlow + flowPerMin * remainingMin
    }
  }

  struct Valve {
    struct ID: Equatable, Hashable {
      let value: Int

      init(from string: some StringProtocol) {
        var radix = 1, value = 0
        for c in string.utf8.reversed() {
          value += Int(c) * radix
          radix *= Int(UInt8.max)
        }
        self.value = value
      }
    }

    let id: ID
    let name: String
    let flowRate: Int
    let tunnels: [ID]

    init(from string: some StringProtocol) {
      var parser = Parser(string)
      parser.consume("Valve ")
      self.name = String(parser.advance(2))
      self.id = ID(from: name)
      parser.consume(" has flow rate=")
      self.flowRate = parser.parseInt()
      parser.consume("; tunnel")
      if parser.peek() == "s" {
        parser.consume("s lead to valve")
      } else {
        parser.consume(" leads to valve")
      }
      parser.consume(parser.peek() == "s" ? "s " : " ") // Ugh why
      var tunnels: [Day16.Valve.ID] = []
      tunnels.append(Day16.Valve.ID(from: parser.advance(2)))
      while parser.hasMore {
        parser.consume(", ")
        tunnels.append(Day16.Valve.ID(from: parser.advance(2)))
      }
      self.tunnels = tunnels
    }
  }
}
