public struct Day07 {
  let input: String

  public init(input: String) {
    self.input = input
  }


  public var part1Solution: Int {
    var cwd: [String] = []
    var sizeStack: [Int] = []
    var sizeByDirectory: [String: Int] = [:]

    for line in input.lines {
      if line.hasPrefix("$ cd ") {
        let directoryName = line.suffix(line.count - 5)
        if directoryName == ".." {
          let cwdSize = sizeStack.last!
          sizeByDirectory[cwd.joined(separator: "/")] = cwdSize
          cwd.removeLast()
          sizeStack.removeLast()
          sizeStack[sizeStack.count - 1] += cwdSize
        } else {
          cwd.append(String(directoryName == "/" ? "" : directoryName))
          sizeStack.append(0)
        }
      } else if line.hasPrefix("$ ls") {
        // Nothing?
      } else if line.hasPrefix("dir ") {
        // Nothing?
      } else {
        let components = line.split(separator: " ")
        sizeStack[sizeStack.count - 1] += Int(String(components[0]))!
      }
    }

    // Finish unwinding the stacks
    while cwd.count > 1 {
      let cwdSize = sizeStack.last!
      sizeByDirectory[cwd.joined(separator: "/")] = cwdSize
      cwd.removeLast()
      sizeStack.removeLast()
      sizeStack[sizeStack.count - 1] += cwdSize
    }

    return sizeByDirectory
      .map(\.value)
      .filter { $0 <= 100000 }
      .reduce(0, +)
  }
}

struct SizeEnumerator {

}
