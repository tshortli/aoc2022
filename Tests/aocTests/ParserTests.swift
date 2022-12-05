import XCTest
import aoc

final class ParserTests: XCTestCase {
  func testPeek() {
    "".parse { XCTAssertNil($0.peek()) }
    "a".parse {
      XCTAssertEqual("a", $0.peek())
      XCTAssertEqual("a", $0.peek())
    }
  }

  func testAdvance() {
    "".parse { XCTAssertNil($0.advance()) }
    "abc".parse {
      XCTAssertEqual("a", $0.advance())
      XCTAssertEqual("b", $0.advance())
      XCTAssertEqual("c", $0.advance())
      XCTAssertNil($0.advance())
      XCTAssertNil($0.advance())
    }
  }

  func testParseInt() {
    "1".parse { XCTAssertEqual(1, $0.parseInt()) }
    "42069".parse { XCTAssertEqual(42069, $0.parseInt()) }
    " 1".parse {
      $0.consume(" ")
      XCTAssertEqual(1, $0.parseInt())
    }
  }
}
