import Algorithms

public struct Day16: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    let map = ValveMap(valves: parseValves())
    var availableValves = Bitset(count: map.valves.count, initialValue: true)
    for (index, valve) in map.valves.enumerated() where valve.flowRate == 0 {
      availableValves[index] = false
    }

    return map.bestFlow(
      currentIndex: map.startIndex,
      remainingMin: 30,
      availableValves: &availableValves
    )
  }

  public var part2Solution: Int {
    let map = ValveMap(valves: parseValves())
    let availableIndices = map.valves.reduce(into: Set<Int>()) { indices, valve in
      if valve.flowRate > 0 {
        indices.insert(valve.index)
      }
    }

    var availableValves = Bitset(count: map.valves.count)
    for index in availableIndices {
      availableValves[index] = true
    }

    var maxFlow = Int.min
    for count in 1...(availableIndices.count / 2) {
      for elephantIndices in availableIndices.combinations(ofCount: count) {
        let elephantIndices = Set(elephantIndices)
        var elephantValves = availableValves
        for index in availableIndices where !elephantIndices.contains(index) {
          elephantValves[index] = false
        }
        let elephantFlow = map.bestFlow(
          currentIndex: map.startIndex,
          remainingMin: 26,
          availableValves: &elephantValves
        )

        var humanValves = availableValves
        for index in availableIndices where elephantIndices.contains(index) {
          humanValves[index] = false
        }
        let humanFlow = map.bestFlow(
          currentIndex: map.startIndex,
          remainingMin: 26,
          availableValves: &humanValves
        )

        maxFlow = max(maxFlow, elephantFlow + humanFlow)
      }
    }

    return maxFlow
  }

  func parseValves() -> [Valve] {
    var index = 0
    var valves: [Valve] = []
    var valveIndicesByName: [String: Int] = [:]
    for line in input.lines {
      let valve = Valve(from: line, index: index)
      valves.append(valve)
      valveIndicesByName[valve.name] = index
      index += 1
    }
    return valves
  }

  struct ValveMap {
    let valves: [Valve]
    let startIndex: Int
    let distancesByIndex: [[Int]]

    init(valves: [Valve]) {
      self.valves = valves
      self.startIndex = valves.filter { $0.name == "AA" }.first!.index
      self.distancesByIndex = Self.distancesByIndex(valves: valves)
    }

    static func distancesByIndex(
      valves: [Valve]
    ) -> [[Int]] {
      let valvesByName = valves.reduce(into: [:]) { dict, valve in
        dict[valve.name] = valve
      }
      var distancesByIndex: [[Int]] = []
      for fromValve in valves {
        var distances: [Int] = Array(repeating: Int.max, count: valves.count)
        var queue: [(String, Int)] = fromValve.tunnelNames.map { ($0, 1) }
        var queueIndex = 0

        while queueIndex < queue.count {
          let (toValveName, distance) = queue[queueIndex]
          let toValve = valvesByName[toValveName]!
          distances[toValve.index] = distance
          for tunnelName in toValve.tunnelNames {
            let tunnelIndex = valvesByName[tunnelName]!.index
            if distances[tunnelIndex] == Int.max && tunnelIndex != fromValve.index {
              queue.append((tunnelName, distance + 1))
            }
          }
          queueIndex += 1
        }

        assert(distancesByIndex.count == fromValve.index)
        distancesByIndex.append(distances)
      }
      return distancesByIndex
    }

    func bestFlow(
      currentIndex: Int,
      remainingMin: Int,
      availableValves: inout Bitset,
      flowPerMin: Int = 0,
      totalFlow: Int = 0
    ) -> Int {
      let distances = distancesByIndex[currentIndex]
      var maxFlow = Int.min
      for index in availableValves.indices(where: true) {
        let minToOpen = distances[index] + 1
        let newRemainingMin = remainingMin - minToOpen
        if newRemainingMin < 0 { continue }

        let newFlowPerMin = flowPerMin + valves[index].flowRate
        let newTotalFlow = totalFlow + flowPerMin * minToOpen
        availableValves[index] = false

        maxFlow = max(maxFlow, bestFlow(
          currentIndex: index,
          remainingMin: newRemainingMin,
          availableValves: &availableValves,
          flowPerMin: newFlowPerMin,
          totalFlow: newTotalFlow
        ))

        availableValves[index] = true
      }

      if maxFlow > Int.min {
        return maxFlow
      }
      return totalFlow + flowPerMin * remainingMin
    }
  }

  struct Valve {
    let index: Int
    let name: String
    let flowRate: Int
    let tunnelNames: [String]

    init(from string: some StringProtocol, index: Int) {
      self.index = index
      var parser = Parser(string)
      parser.consume("Valve ")
      self.name = String(parser.advance(2))
      parser.consume(" has flow rate=")
      self.flowRate = parser.parseInt()
      parser.consume("; tunnel")
      if parser.peek() == "s" {
        parser.consume("s lead to valve")
      } else {
        parser.consume(" leads to valve")
      }
      parser.consume(parser.peek() == "s" ? "s " : " ") // Ugh why
      var tunnelNames: [String] = []
      tunnelNames.append(String(parser.advance(2)))
      while parser.hasMore {
        parser.consume(", ")
        tunnelNames.append(String(parser.advance(2)))
      }
      self.tunnelNames = tunnelNames
    }
  }

  struct Bitset {
    var values: UInt64
    let count: Int

    init(count: Int, initialValue: Bool = false) {
      precondition(count <= UInt64.bitWidth)
      self.values = initialValue ? ~0 : 0
      self.count = count
    }

    subscript(_ index: Int) -> Bool {
      get {
        assert(index < count)
        return (values & (1 << index)) != 0
      }
      set {
        assert(index < count)
        if newValue {
          values |= 1 << index
        } else {
          values &= ~(1 << index)
        }
      }
    }

    func indices(where predicate: Bool) -> IndexSequence {
      IndexSequence(base: self, predicate: predicate)
    }

    struct IndexSequence: Swift.Sequence {
      let base: Bitset
      let predicate: Bool

      struct Iterator: IteratorProtocol {
        let base: Bitset
        let predicate: Bool
        var index: Int = 0

        mutating func next() -> Int? {
          for i in index..<base.count {
            if base[i] == predicate {
              index = i + 1
              return i
            }
          }
          return nil
        }
      }

      func makeIterator() -> Iterator {
        Iterator(base: base, predicate: predicate)
      }
    }
  }
}
