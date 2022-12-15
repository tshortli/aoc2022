public struct Day15: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  public var part1Solution: Int {
    countNoBeacon(row: 2000000)
  }

  public var part2Solution: Int {
    distressBeaconTuningFrequency(bound: 4000000)
  }

  public func countNoBeacon(row y: Int) -> Int {
    let sensorRecords = input.lines.map { $0.parseSensorRecord() }
    let minX = sensorRecords
      .map { $0.sensorPoint.x - $0.distance }
      .min()!
    let maxX = sensorRecords
      .map { $0.sensorPoint.x + $0.distance }
      .max()!

    let beaconPoints: Set<Point> = sensorRecords
      .reduce(into: []) { $0.insert($1.beaconPoint) }

    var count = 0
    for x in minX...maxX {
      let point = Point(x: x, y: y)
      if beaconPoints.contains(point) {
        continue
      }
      
      for record in sensorRecords {
        if point.manhattanDistance(to: record.sensorPoint) <= record.distance {
          count += 1
          break
        }
      }
    }

    return count
  }

  public func distressBeaconTuningFrequency(bound: Int) -> Int {
    let sensorRecords = input.lines.map { $0.parseSensorRecord() }
    var potentialPoints = sensorRecords[0].boundaryPoints
    for record in sensorRecords.dropFirst() {
      potentialPoints.formUnion(record.boundaryPoints)
    }

    let matches = potentialPoints.filter {
      guard $0.x >= 0 && $0.x <= bound && $0.y >= 0 && $0.y <= bound else {
        return false
      }
      for record in sensorRecords {
        if $0.manhattanDistance(to: record.sensorPoint) <= record.distance {
          return false
        }
      }
      return true
    }
    assert(matches.count == 1)

    return matches.first!.x * 4000000 + matches.first!.y
  }

  struct Point: Equatable, Hashable, CustomStringConvertible {
    var x: Int, y: Int

    func manhattanDistance(to other: Point) -> Int {
      abs(x - other.x) + abs(y - other.y)
    }

    func pointsAtDistance(_ distance: Int) -> Set<Point> {
      var points: Set<Point> = []
      var point = Point(x: x, y: y + distance)
      for _ in 1...distance {
        points.insert(point)
        point.translate(1, -1)
      }
      for _ in 1...distance {
        points.insert(point)
        point.translate(-1, -1)
      }
      for _ in 1...distance {
        points.insert(point)
        point.translate(-1, 1)
      }
      for _ in 1...distance {
        points.insert(point)
        point.translate(1, 1)
      }

      return points
    }

    mutating func translate(_ dx: Int, _ dy: Int) {
      x += dx
      y += dy
    }

    var description: String { "(\(x), \(y))" }
  }

  struct SensorRecord {
    let sensorPoint: Point
    let beaconPoint: Point
    let distance: Int

    init(sensorPoint: Point, beaconPoint: Point) {
      self.sensorPoint = sensorPoint
      self.beaconPoint = beaconPoint
      self.distance = sensorPoint.manhattanDistance(to: beaconPoint)
    }

    var boundaryPoints: Set<Point> {
      sensorPoint.pointsAtDistance(distance + 1)
    }
  }
}

private extension StringProtocol {
  func parseSensorRecord() -> Day15.SensorRecord {
    var parser = Parser(self)
    parser.consume("Sensor at x=")
    let sx = parser.parseInt()
    parser.consume(", y=")
    let sy = parser.parseInt()
    parser.consume(": closest beacon is at x=")
    let bx = parser.parseInt()
    parser.consume(", y=")
    let by = parser.parseInt()

    return Day15.SensorRecord(
      sensorPoint: Day15.Point(x: sx, y: sy),
      beaconPoint: Day15.Point(x: bx, y: by)
    )
  }
}
