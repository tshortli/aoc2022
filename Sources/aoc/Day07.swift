public struct Day07: Solver {
  let input: String

  public init(input: String) {
    self.input = input
  }

  var directorySizes: [Int] {
    var sizeStack: [Int] = []
    var directorySizes: [Int] = []

    func pop() {
      let cwdSize = sizeStack.last!
      directorySizes.append(cwdSize)
      sizeStack.removeLast()
      sizeStack[sizeStack.endIndex - 1] += cwdSize
    }

    for line in input.lines {
      if line == "$ cd .." {
        pop()
      } else if line.hasPrefix("$ cd ") {
        sizeStack.append(0)
      } else if !line.hasPrefix("$ ls") && !line.hasPrefix("dir ") {
        let components = line.split(separator: " ")
        sizeStack[sizeStack.count - 1] += Int(String(components[0]))!
      }
    }

    // Finish unwinding the stack
    while sizeStack.count > 1 {
      pop()
    }

    // Add the root directory size
    directorySizes.append(sizeStack.first!)
    return directorySizes
  }

  public var part1Solution: Int {
    return directorySizes.reduce(0) { totalSize, directorySize in
      (directorySize <= 100000) ? totalSize + directorySize : totalSize
    }
  }

  public var part2Solution: Int {
    let sizes = directorySizes
    let minSizeNeeded = sizes.last! - 40000000 // "/" is the last element

    return sizes.reduce(Int.max) { minSize, directorySize in
      (directorySize >= minSizeNeeded) ? min(directorySize, minSize) : minSize
    }
  }
}
